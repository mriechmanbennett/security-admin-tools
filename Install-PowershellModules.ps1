[CmdletBinding()]
param(
    [Parameter(Mandatory = $false, Position = 0)]
    [String]$Scope = "user",

    [Parameter(Mandatory=$false)]
    [switch]$Clean
)

# Get current directory, then change to script root to execute
$StartDirectory = $PWD
Set-Location $PSScriptRoot
$ModulesPath = "powershell\modules"

# If Powershell 6+
if ($PSVersionTable.PSEdition -eq 'Core') {
    $InstallPath = if ($Scope -eq "system") { 
        "$Env:ProgramFiles\PowerShell\Modules\"
    }
    else {
        "$HOME\Documents\PowerShell\Modules\"
    }
}

# If Powershell 5.1
if ($PSVersionTable.PSEdition -eq 'Desktop') {
    $InstallPath = if ($Scope -eq "system") { 
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
        $InstallPath = if ($Scope -eq "system") { 
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
$ProfilePath = if ($Scope -eq "system") {
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