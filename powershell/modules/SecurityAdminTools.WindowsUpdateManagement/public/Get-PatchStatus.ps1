function Get-PatchStatus {
    <#
    .SYNOPSIS
        Get patch status for one or many computers

    .DESCRIPTION
        Get patch status for one or many computers

    .PARAMETER ComputerName
        Computers to check for patch status

    .EXAMPLE
        Get-PatchStatus

    .EXAMPLE
        Get-PatchStatus -Computer localhost

        Get patch status for the local computer

    .LINK
        https://github.com/mriechmanbennett/security-admin-tools/

    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false,Position=0)]
        [Alias('Computer','Host','Hostname')]
        [string[]]$ComputerName = 'localhost'
    )

    #------------ Script start ------------#

    BEGIN {
        Write-Verbose 'Begin block'
    }

    PROCESS {
        Write-Verbose 'Process block'

        foreach ($Cpu in $ComputerName) {
            Write-Verbose "Querying $Cpu"
            # Get-CimInstance -ClassName Win32_QuickFixEngineering| select HotFixID, InstalledOn | sort InstalledOn -Descending
            # wmic qfe list brief /format:table
            $HotfixesInstalled = Get-HotFix -ComputerName localhost | Select-Object HotFixID, InstalledOn, InstalledBy, Description
            $CaptionOutput = (Get-WmiObject Win32_OperatingSystem).Caption
            switch -Wildcard ($CaptionOutput) {
                '*Server 2022*' { $OSName = 'Server2022' }
                default { Write-Verbose "No OS Name match for $Cpu"; $OSName = 'NotFound'}
            }
                
            $OSVersion = (Get-Item 'HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion').GetValue('DisplayVersion')

            write-verbose "$OSName - $OSVersion"
            $LatestKBAvailable = (Get-LatestOSBuild -OSName $OSName -OSVersion $OSVersion).'KB article'.toString()
            $IsPatched = $LatestKBAvailable -in $HotfixesInstalled.HotFixID
            
            #write-verbose $HotfixesInstalled.HotFixID
            #$MostRecentKBInstalled = Sort-Object -Descending -Property HotFixID -InputObject $HotfixesInstalled -Top 1
            #Write-Verbose $MostRecentKBInstalled

            $PatchStatus = [PSCustomObject]@{
                Name = $Cpu
                IsPatched = $IsPatched
                OSName = $OSName
                OSVersion = $OSVersion
                HotfixesInstalled = $HotfixesInstalled
                #KBMostRecent = $MostRecentKBInstalled.HotFixID
                #InstallDateMostRecent = $MostRecentKBInstalled.InstalledOn
                #InstalledByMostRecent = $MostRecentKBInstalled.InstalledBy
                #DescriptionMostRecent = $MostRecentKBInstalled.Description
            }

            Write-Output $PatchStatus
        }
    }

    END {
        Write-Verbose 'End block'
    }

}
