function Get-ASRExclusion() {
	<#
    .SYNOPSIS
        Get Defender ASR exclusions from a computer

    .DESCRIPTION
        Get Defender ASR exclusions from a computer

    .PARAMETER Computer
        Computer from which to retrieve configuration

    .EXAMPLE
        Get-ASRExclusion

    .EXAMPLE
        Get-ASRExclusion -Computer remote-host

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
		$FunctionName = 'Get-ASRExclusion'
		$StartTime = Get-Date
		Write-Verbose "[BEGIN  ] $FunctionName"
		Write-Verbose "[BEGIN  ] StartTime = $StartTime"
	}

	PROCESS {
		foreach ( $Computer in $ComputerName ) {
			Write-Verbose "[PROCESS] Process $Computer at $(Get-Date)"
			
			$ComputerDefenderState = Get-DefenderState -ComputerName $Computer
			$AttackSurfaceReductionOnlyExclusions = $ComputerDefenderState.MpPreference | Select-Object -ExpandProperty AttackSurfaceReductionOnlyExclusions
			$AttackSurfaceReductionRules_RuleSpecificExclusions = $ComputerDefenderState.MpPreference | Select-Object -ExpandProperty AttackSurfaceReductionRules_RuleSpecificExclusions
			$HostName = $ComputerDefenderState.HostName

			$DefenderExclusionProperties = @{
				'HostName' = $HostName
				'AttackSurfaceReductionOnlyExclusions' = $AttackSurfaceReductionOnlyExclusions
				'AttackSurfaceReductionRules_RuleSpecificExclusions' = $AttackSurfaceReductionRules_RuleSpecificExclusions
			}

			$DefenderAsrExclusions = [pscustomobject]$DefenderExclusionProperties
			$DefenderAsrExclusions.PSObject.TypeNames.Insert(0,'SecurityAdminTools.WindowsDefender.Exclusion.ASR')
			Write-Output $DefenderAsrExclusions
		}
	}

	END {
		$EndTime = Get-Date
		$TimeSpan = New-TimeSpan -Start $StartTime -End $EndTime
		Write-Verbose "[END    ] EndTime = $EndTime"
		Write-Verbose "[END    ] RunTime = $TimeSpan"
		Write-Verbose "[END    ] $FunctionName"
	}


	<# Original script
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
	#>
}
