function Get-RDPLogs() {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$false)]
		[Int32]$Limit,

		[Parameter(Mandatory=$false)]
		[String]$Computer = $env:COMPUTERNAME
	)

	$LogName = 'Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational' 
    $LogFilter = '<QueryList><Query Id="0"><Select>*[System[EventID=1149]]</Select></Query></QueryList>'

    $RDPAuths = Get-WinEvent -LogName $LogName -FilterXPath $LogFilter -ComputerName $Computer
	
    [xml[]]$xml = $RDPAuths | Foreach-Object {$_.ToXml()}
	$EventData = Foreach ($LogEvent in $xml.Event) {
		New-Object PSObject -Property @{
			TimeCreated = (Get-Date ($LogEvent.System.TimeCreated.SystemTime) -Format 'yyyy-MM-dd hh:mm:ss K')
			User = $LogEvent.UserData.EventXML.Param1
			Domain = $LogEvent.UserData.EventXML.Param2
			Client = $LogEvent.UserData.EventXML.Param3
		}
	} 
	$EventData | Format-Table
}