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
        }
    }

    END {
        Write-Verbose 'End block'
    }

}
