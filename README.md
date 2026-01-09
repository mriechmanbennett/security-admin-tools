# Security Admin Tools (SAT2)

## Contents
Listing a table of contents this early feels ambitious.

- [Info](#info)
- [Usage](#usage)

## Info

This is a side project to learn about Powershell module development.
Initial development goals are to make scripts I use for work more flexible.

## Usage

The script [InstallPowershellModules.ps1](scripts-meta/InstallPowershellModules.ps1) will copy the module files into your
PSModulePath. It defaults to the CurrentUser scope, but can be specified with:
```
InstallPowershellModules.ps1 -Scope system
```

