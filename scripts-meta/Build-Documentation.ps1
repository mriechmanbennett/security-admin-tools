<#
.SYNOPSIS
    Generate markdown documentation for the project

.DESCRIPTION
    Generate markdown documentation for the project
    Uses the PlatyPS module to dynamically document the project's
    Powershell modules. This script is brittle; it is only intended
    to work within the context of this project.

.PARAMETER Force
    Switch parameter; allow overwriting of existing files

.EXAMPLE
    Build-Documentation

.EXAMPLE
    Build-Documentation -Force

.LINK
    https://github.com/mriechmanbennett/security-admin-tools/

#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [switch]$Force
)

#------------ Script start ------------#
# Import dependencies
# $platyPSModuleName = 'Microsoft.PowerShell.PlatyPS'
#try { Get-InstalledModule -Name Microsoft.PowerShell.PlatyPS }
#catch { Write-Host "platyPS not installed. Attempting to install..."
#    try { Install-PSResource -Name Microsoft.PowerShell.PlatyPS }
#    catch { Write-Host "Failed to install platyPS, exiting"; exit }
#}
#finally { Write-Host "platyPS module is installed" }

try { Import-Module -Name Microsoft.PowerShell.PlatyPS }
catch { Write-Host "platyPS module could not be imported"; exit }
finally { Write-Host "Imported platyPS module" }

# Set file paths
$RepositoryPath = (Get-Item -Path $PSScriptRoot).Parent
$DocsPath = "$RepositoryPath\docs"
$PSModuleDocsPath = "$DocsPath\powershell-module-docs"
$PSModulesFolderPath = "$RepositoryPath\powershell\modules"

# Get list of modules and import them to this session
$ModuleList = @( (Get-ChildItem -Path $PSModulesFolderPath -Directory).BaseName )

# Write module documentation
# New-MarkdownHelp -Force -Module $ModuleList -OutputFolder $PSModuleDocsPath

$newMarkdownCommandHelpSplat = @{
    ModuleInfo = Get-Module -Name 'SecurityAdminTools.Utilities'
    OutputFolder = $PSModuleDocsPath
    WithModulePage = $true
}
New-MarkdownCommandHelp -Force @newMarkdownCommandHelpSplat