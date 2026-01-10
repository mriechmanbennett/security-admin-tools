function Get-ASRExclusions() {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$false)]
		[String]$Computer = $env:COMPUTERNAME
	)

	$Preferences = $null
	if ($Computer -eq $env:COMPUTERNAME){
		$Preferences = Get-MpPreference
	}
	else {
		$RemoteSession = New-CimSession -ComputerName $Computer
		$Preferences = Get-MpPreference -CimSession $RemoteSession
	}

	# Display the ASR general exclusions
	Write-Host "ASR General Exclusions:"
	if ($Preferences.AttackSurfaceReductionOnlyExclusions) {
		$Preferences.AttackSurfaceReductionOnlyExclusions | ForEach-Object { Write-Host "- $_" }
	}
	else {
		Write-Host "No ASR general exclusions configured."
	}
	Write-Host ""

	# Display the ASR rule-specific exclusions
	Write-Host "ASR Rule-Specific Exclusions:"
	if ($Preferences.AttackSurfaceReductionRules_RuleSpecificExclusions) {
		$Preferences.AttackSurfaceReductionRules_RuleSpecificExclusions | ForEach-Object { Write-Host "- $_" }
	}
	else {
		Write-Host "No ASR general exclusions configured."
	}
	Write-Host ""
}