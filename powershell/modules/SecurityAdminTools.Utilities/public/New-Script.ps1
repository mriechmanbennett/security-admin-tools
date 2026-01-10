function New-Script() {
    [CmdletBinding()]
        param(
            # Name for the new script
            [Parameter(Mandatory=$false, Position=0)]
            [String]$ScriptName = 'New-ExampleScript',

            # Synopsis
            [Parameter(Mandatory=$false)]
            [String]$Synopsis = "Synopsis for new script",
            
            # Argument for the manifest description
            [Parameter(Mandatory=$false)]
            [String]$Description = "Description for new script",

            [Parameter(Mandatory=$false)]
            [String]$Link = "https://github.com/mriechmanbennett/security-admin-tools/"
        )


    $ScriptTemplate = {
"function $ScriptName {
    <#
    .SYNOPSIS
        $Synopsis

    .DESCRIPTION
        $Description

    .PARAMETER Example
        Example parameter

    .PARAMETER Example2
        Example2 parameter, uses ValidateSet

    .EXAMPLE
        $ScriptName

    .EXAMPLE
        $ScriptName -Example example

    .LINK
        $Link

    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=`$false,Position=0)]
        [string]`$Example = `"Example`",

        [Parameter(Mandatory = `$false)]
        [ValidateSet('One','Two','Three','All')]
        [string]`$Example2 = 'All',
    )

    #------------ Script start ------------#
    # Delete this comment and add the script here

}
"
    }

    $ScriptTemplate | Out-File -FilePath ".\$ScriptName.ps1"
}