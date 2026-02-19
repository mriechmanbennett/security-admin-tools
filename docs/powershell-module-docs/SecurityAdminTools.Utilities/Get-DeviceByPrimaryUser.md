---
document type: cmdlet
external help file: SecurityAdminTools.Utilities-Help.xml
HelpUri: https://github.com/mriechmanbennett/security-admin-tools/
Locale: en-US
Module Name: SecurityAdminTools.Utilities
ms.date: 02/18/2026
PlatyPS schema version: 2024-05-01
title: Get-DeviceByPrimaryUser
---

# Get-DeviceByPrimaryUser

## SYNOPSIS

Gets Intune primary devices given a user UPN

## SYNTAX

### __AllParameterSets

```
Get-DeviceByPrimaryUser [-Upn] <string> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Gets Intune primary devices given a user UPN

## EXAMPLES

### EXAMPLE 1

Get-DeviceByPrimaryUser

### EXAMPLE 2

Get-DeviceByPrimaryUser username@domain.com

## PARAMETERS

### -Upn

User UPN to search for devices

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

Original script contributed by Brian L
Depends on Microsoft.Graph.Beta.DeviceManagement


## RELATED LINKS

- [](https://github.com/mriechmanbennett/security-admin-tools/)
