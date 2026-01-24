# Security Admin Tools (SAT2)

## Contents

Listing a table of contents this early feels ambitious.

- [Info](#info)
- [Usage](#usage)
- [Compatibility](#compatibility)
- [Acknowledgements](#acknowledgements)

## Info

This is a side project to learn about Powershell module development.
Initial development goals are to make scripts I use for work more flexible.

## Usage

The script [Install-PowershellModules.ps1](Install-PowershellModules.ps1) will copy the
module files into your PSModulePath. It defaults to the CurrentUser scope, but can be
specified to install for all users with:

```Powershell
InstallPowershellModules.ps1 -Scope system
```

## Compatibility

Best effort is made for these commands to work in both Powershell 5.1 and in Powershell 7+.
They are generally going to be tested in 5.1, and Powershell 7-exclusive features will be
avoided. The Install-PowershellModules.ps1 script will configure things properly if it is
called from both 5.1 and 7+.

The module manifests will indicate cross-compatibility unless I identify a conflict.

No attempt will be made at Linux compatibility unless the CimCmdlets module becomes available
and easily usable on both Debian and Arch-based distros for remote management of Windows systems.

No attempt will be made at Mac compatibility because I don't happen to own one.

## Acknowledgements

The below people have provided either scripts or ideas used in this project.

- Moose
- Bob
- BJDS, for the project name I yoinked as a joke
