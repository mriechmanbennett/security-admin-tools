function New-Script() {
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
            'https://www.aclu.org/give/ways-to-give'
        } else {
            $env:NewScriptLink
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