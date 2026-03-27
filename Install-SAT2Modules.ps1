<#
.SYNOPSIS
    Install modules and add imports to profile

.DESCRIPTION
    Install modules and add imports to profile.
    They need to be imported each time to avoid the issue of pwsh not auto-importing modules with prefixes:
    https://github.com/PowerShell/PowerShell/issues/24743

.PARAMETER Clean
    Explicitly delete old module files before copying the new ones over

.PARAMETER System
    Set this variable to install for all users and add to the AllUsersAllHosts profile instead of to the CurrentUserAllHosts profile

.NOTES
    This does not work for a normal user if there is a MyDocuments redirect configured.
    Need to figure that out but tbd

.LINK
    https://github.com/mriechmanbennett/security-admin-tools/

#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [Switch]$System,

    [Parameter(Mandatory=$false)]
    [switch]$Clean
)

# Get current directory, then change to script root to execute
$StartDirectory = $PWD
Set-Location $PSScriptRoot
$ModulesPath = "powershell\modules"

# If Powershell 6+
if ($PSVersionTable.PSEdition -eq 'Core') {
    $InstallPath = if ($System -eq $true) { 
        "$Env:ProgramFiles\PowerShell\Modules\"
    }
    else {
        "$HOME\Documents\PowerShell\Modules\"
    }
}

# If Powershell 5.1
if ($PSVersionTable.PSEdition -eq 'Desktop') {
    $InstallPath = if ($System -eq $true) { 
        "$Env:ProgramFiles\WindowsPowerShell\Modules\"
    }
    else {
        "$HOME\Documents\WindowsPowerShell\Modules\"
    }
}

# If Powershell <5.1

if ($PSVersionTable.PSVersion -lt [Version]'5.1') {
    Write-Host "PowerShell version is less than 5.1`
    Many of these scripts/modules will not work on your system."
    $ContinueAnyway = Read-Host -Prompt "Type 'continue' to install anyway or anything else to exit:"
    
    if ($ContinueAnyway -eq 'continue') {
        $InstallPath = if ($System -eq $true) { 
        "$Env:ProgramFiles\WindowsPowerShell\Modules\"
        }
        else {
            "$HOME\Documents\WindowsPowerShell\Modules\"
        }
    }
    else {
        exit
    }
}

# If Clean
if ($Clean) {
    Write-Host 'WARNING: Clean flag only clears out the files copied into the module path. The profile changes are not properly managed.'
    Get-ChildItem -Path "$InstallPath\SecurityAdminTools.*" | Remove-Item -Recurse
}

# Install modules and import them in the desired profile
$ProfilePath = if ($System -eq $true) {
    $PROFILE.AllUsersAllHosts
}
else { $PROFILE.CurrentUserAllHosts }
    
$ModuleFolders = Get-ChildItem $ModulesPath

[string[]] $ModuleNames = @()

foreach ($Folder in $ModuleFolders) {
    Copy-Item -Path $Folder.FullName -Destination $InstallPath -Recurse -Force
    $ModuleNames += $Folder.Name
}

# Import modules into current session
Import-Module -Name $ModuleNames -Force

# Create Profile if it doesn't exist
if (!(Test-Path -Path $ProfilePath )) { New-Item -Type File -Path $ProfilePath -Force }

# Add Import-Module to profile if it is not already present
write-output $ModuleNames
foreach ($NewModule in $ModuleNames) {
    $ImportLine = "Import-Module -Name $NewModule"
    [boolean]$LineFound = $false
    
    Get-Content $ProfilePath | foreach-object {
        if ($_ -match $ImportLine) { $LineFound = $true }
    }
    if (!$LineFound) { $ImportLine | out-file $ProfilePath -append }
}


# Send us back to the original directory the script was called from
Set-Location $StartDirectory