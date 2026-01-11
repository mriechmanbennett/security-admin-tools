function New-Script() {
    <#
    .SYNOPSIS
        $Synopsis

    .DESCRIPTION
        $Description

    .PARAMETER ScriptNameOrPath
        First position argument, takes a string with the desired script name or a path
        for the new script file. Path can be relative or absolute.

    .PARAMETER Synopsis
        String that populates the Synopsis text. Defaults to filler.

    .PARAMETER Description
        String that populates the Description text. Defaults to filler.

    .PARAMETER Link
        String that populates the Link text. Defaults to a generic URL.
        If the variable $EnvNewScriptLink is set, it will use that instead.

    .EXAMPLE
        New-Script
        Creates a new script in the current directory with filler default options.

    .EXAMPLE
        New-Script Get-ExampleScript
        Creates a new script in the current directory with the name Get-ExampleScript.ps1.

    .LINK
        https://github.com/mriechmanbennett/security-admin-tools/

    #>

    [CmdletBinding()]
    param(
        # Name for the new script
        [Parameter(Mandatory=$false, Position=0)]
        [String]$ScriptNameOrPath = 'New-ExampleScript',

        # Synopsis
        [Parameter(Mandatory=$false)]
        [String]$Synopsis = "Synopsis for new script",
            
        # Argument for the manifest description
        [Parameter(Mandatory=$false)]
        [String]$Description = "Description for new script",

        [Parameter(Mandatory=$false)]
        [String]$Link
    )

    
    if ([string]::IsNullOrWhiteSpace($Link)) {
        $Link = if ([string]::IsNullOrEmpty($EnvNewScriptLink)) {
            'https://www.aclu.org/give/ways-to-give/'
        } else {
            $EnvNewScriptLink
        }
    }


    # Determine if we were passed a script name or full path for the new script file
    if ($ScriptNameOrPath -contains "\"){
        if ( $ScriptNameOrPath.EndsWith(".ps1") ){
            # if this is a path not in the current directory, and it ends with the file name
        }
        else {
            # If this is a path not in the current directory, and ends without .ps1
        }
    }
    else {
        if ( $ScriptNameOrPath.EndsWith(".ps1") ) {
            # If this is a path in the current directory
            $ScriptName = $ScriptNameOrPath.Trim('.ps1')
            $ScriptPath = $ScriptNameOrPath
        }
        else {
            # If this is the name of a script with no path specified
            $ScriptName = $ScriptNameOrPath
            $ScriptPath = "$ScriptNameOrPath.ps1"
        }
    }


    $ScriptTemplate =
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

        [Parameter(Mandatory=`$false)]
        [ValidateSet('One','Two','Three','All')]
        [string]`$Example2 = 'All'
    )

    #------------ Script start ------------#
    # Delete this comment and add the script here

}"


    $ScriptTemplate | Out-File -FilePath $ScriptPath
}