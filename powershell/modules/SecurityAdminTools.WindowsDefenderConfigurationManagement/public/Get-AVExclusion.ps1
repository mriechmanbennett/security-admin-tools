function Get-AVExclusion() {
	<#
    .SYNOPSIS
        Get Defender AV exclusions from a computer

    .DESCRIPTION
        Get Defender AV exclusions from a computer

    .PARAMETER ComputerName
        Computers from which to retrieve configuration

    .EXAMPLE
        Get-AVExclusion

    .EXAMPLE
        Get-AVExclusion -ComputerName remote-host

		Gets configuration from computer named 'remote-host'

    .LINK
        https://github.com/mriechmanbennett/security-admin-tools/

    #>

	[CmdletBinding()]
	param(
		[Parameter(
			Mandatory=$false,
			ValueFromPipeline=$true
		)]
		[String[]]$ComputerName = $env:COMPUTERNAME
	)

	BEGIN {
		$FunctionName = 'Get-AvExclusion'
		$StartTime = Get-Date
		Write-Verbose "[BEGIN  ] $FunctionName"
		Write-Verbose "[BEGIN  ] StartTime = $StartTime"
	}

	PROCESS {
		foreach ( $Computer in $ComputerName ) {
			Write-Verbose "[PROCESS] Process $Computer at $(Get-Date)"
			$ComputerDefenderState = Get-DefenderState -ComputerName $Computer
			$AvExclusionPath = $ComputerDefenderState.MpPreference | Select-Object -ExpandProperty ExclusionPath
			$AvExclusionExtension = $ComputerDefenderState.MpPreference | Select-Object -ExpandProperty ExclusionExtension
			$AvExclusionProcess = $ComputerDefenderState.MpPreference | Select-Object -ExpandProperty ExclusionProcess
			$AvExclusionIpAddress = $ComputerDefenderState.MpPreference | Select-Object -ExpandProperty ExclusionIpAddress
			$HostName = $ComputerDefenderState.HostName

			$DefenderExclusionProperties = @{
				'HostName' = $HostName
				'AvExclusionPath' = $AvExclusionPath
				'AvExclusionExtension' = $AvExclusionExtension
				'AvExclusionProcess' = $AvExclusionProcess
				'AvExclusionIpAddress' = $AvExclusionIpAddress
			}

			$DefenderExclusions = [pscustomobject]$DefenderExclusionProperties
			Write-Output $DefenderExclusions
		}
	}

	END {
		$EndTime = Get-Date
		$TimeSpan = New-TimeSpan -Start $StartTime -End $EndTime
		Write-Verbose "[END    ] EndTime = $EndTime"
		Write-Verbose "[END    ] RunTime = $TimeSpan"
		Write-Verbose "[END    ] $FunctionName"
	}

}
<# Original script

	# Display the ExclusionPath list
	Write-Host "Exclusion Paths:"
	if ($Preferences.ExclusionPath) {
		$Preferences.ExclusionPath | ForEach-Object { Write-Host "- $_" }
	}
	else {
		Write-Host "No exclusion paths configured."
	}
	Write-Host ""

	# Display the ExclusionProcess list 
	Write-Host "Exclusion Processes:" 
	if ($Preferences.ExclusionProcess) { 
		$Preferences.ExclusionProcess | ForEach-Object { Write-Host "- $_" } 
	}
	else {
		Write-Host "No exclusion processes configured." 
	} 
	Write-Host "" 

	# Display the ExclusionExtension list 
	Write-Host "Exclusion Extensions:" 
	if ($Preferences.ExclusionExtension) { 
		$Preferences.ExclusionExtension | ForEach-Object { Write-Host "- $_" } 
	}
	else { 
		Write-Host "No exclusion extensions configured." 
	} 

#>
