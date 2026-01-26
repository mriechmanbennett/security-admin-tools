function Get-AVExclusions() {
	<#
    .SYNOPSIS
        Get Defender AV exclusions from a computer

    .DESCRIPTION
        Get Defender AV exclusions from a computer

    .PARAMETER Computer
        Computer from which to retrieve configuration

    .EXAMPLE
        Get-AVExclusions

    .EXAMPLE
        Get-AVExclusions -Computer remote-host

		Gets configuration from computer named 'remote-host'

    .LINK
        https://github.com/mriechmanbennett/security-admin-tools/

    #>

	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$false)]
		[String]$Computer = $env:COMPUTERNAME
	)

	$Preferences = $null
	if ($Computer -eq $env:COMPUTERNAME) {
		$Preferences = Get-MpPreference
	}
	else {
		$RemoteSession = New-CimSession -ComputerName $Computer
		$Preferences = Get-MpPreference -CimSession $RemoteSession
	}

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
}