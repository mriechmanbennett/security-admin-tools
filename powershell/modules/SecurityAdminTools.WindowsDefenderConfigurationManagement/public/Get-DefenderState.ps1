function Get-DefenderState() {
	<#
    .SYNOPSIS
        Get Defender settings and status from a computer

    .DESCRIPTION
        Get Defender settings and status from a computer
		Creates a combined object with all information

    .PARAMETER ComputerName
        Computers from which to retrieve configuration

    .EXAMPLE
        Get-DefenderState

    .EXAMPLE
        Get-DefenderState -ComputerName remote-host

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
		$FunctionName = 'Get-DefenderState'
		$StartTime = Get-Date
		Write-Verbose "[BEGIN  ] $FunctionName"
		Write-Verbose "[BEGIN  ] StartTime = $StartTime"

		# Set script block to execute remotely during the process block
		$MpPreferenceScriptBlock = {
			Write-Verbose "[PROCESS] Get-MpComputerStatus"
			$MpStatus = Get-MpComputerStatus

			Write-Verbose "[PROCESS] Get-MpPreference"
			$MpPreference = Get-MpPreference

			Write-Verbose "[PROCESS] Get remote computer data"
			$RemoteDateTime = Get-Date
			$HostName = $env:COMPUTERNAME

			# Construct custom object
			$DefenderProperties = @{
				'HostName' = $HostName
				'ComputerTime' = $RemoteDateTime
				'MpStatus' = $MpStatus
				'MpPreference' = $MpPreference
			}

			Write-Verbose "[PROCESS] Return state"
			$DefenderState = [pscustomobject]$DefenderProperties
			$DefenderState.PSObject.TypeNames.Insert(0,'SecurityAdminTools.WindowsDefender.State')
			return $DefenderState
		}
	}

	PROCESS {
		foreach ( $Computer in $ComputerName ) {
			Write-Verbose "[PROCESS] Process $Computer at $(Get-Date)"
			$ComputerDefenderState = Invoke-Command -ScriptBlock $MpPreferenceScriptBlock -ComputerName $Computer
			Write-Output $ComputerDefenderState
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