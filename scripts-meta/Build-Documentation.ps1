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
try { Import-Module platyPS }
catch { Write-Host "platyPS module could not be imported"; exit }
finally { Write-Host "Imported platyPS module" }

# Set file paths
$RepositoryPath = (Get-Item -Path $PSScriptRoot).Parent
$DocsPath = "$RepositoryPath\docs"
$PSModuleDocsPath = "$DocsPath\powershell-module-docs"
$ModulesFolderPath = "$RepositoryPath\powershell\modules"

# Get list of modules and import them to this session
$ModuleList = @( (Get-ChildItem -Path $ModulesFolderPath -Directory).BaseName )

# Write module documentation
New-MarkdownHelp -Force -Module $ModuleList -OutputFolder $PSModuleDocsPath