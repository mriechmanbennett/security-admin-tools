[CmdletBinding()]
    param(
	    [Parameter(Mandatory=$false, Position=0)]
	    [String]$Scope = "user"
    )

Set-Location $PSScriptRoot
$ModulesPath = "..\powershell\modules"

$InstallPath = if ($Scope -eq "system") { 
    "$Env:ProgramFiles\WindowsPowerShell\Modules\"
} else {
    "$HOME\Documents\WindowsPowerShell\Modules\"
}

$ProfilePath = if ($Scope -eq "system") {
    $PROFILE.AllUsersAllHosts
} else { $PROFILE.CurrentUserAllHosts }
	
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