# Security Admin Tools (SAT2)

## Contents
Listing a table of contents this early feels ambitious.

- [Info](#info)
- [Usage](#usage)
- [Acknowledgements](#acknowledgements)

## Info

This is a side project to learn about Powershell module development.
Initial development goals are to make scripts I use for work more flexible.

## Usage

The script [InstallPowershellModules.ps1](InstallPowershellModules.ps1) will copy the module files into your
PSModulePath. It defaults to the CurrentUser scope, but can be specified to install for all users with:
```
InstallPowershellModules.ps1 -Scope system
```

## Acknowledgements
- Moose
- Bob
- BJDS, for the project name I yoinked