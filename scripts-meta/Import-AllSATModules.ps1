<#
.SYNOPSIS
    Imports all modules from the repository powershell/modules directory

.DESCRIPTION
    Imports all modules from the repository powershell/modules directory

.EXAMPLE
    Import-AllSATModules

.LINK
    https://github.com/mriechmanbennett/security-admin-tools

#>

#------------ Script start ------------#
$ModulesPath = "$PSScriptRoot/../powershell/modules"
$ModuleList = Get-ChildItem $ModulesPath
$CurrentDir = Get-Location

# Import all modules
Set-Location $ModulesPath
Foreach ( $ModuleName in $ModuleList ) {
    Import-Module -Force $ModuleName
}

# Return to working directory
Set-Location $CurrentDir