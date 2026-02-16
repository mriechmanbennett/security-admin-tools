---
document type: cmdlet
external help file: SecurityAdminTools.WindowsUpdateManagement-Help.xml
HelpUri: https://github.com/mriechmanbennett/security-admin-tools/
Locale: en-US
Module Name: SecurityAdminTools.WindowsUpdateManagement
ms.date: 02/15/2026
PlatyPS schema version: 2024-05-01
title: Get-PatchStatus
---

# Get-PatchStatus

## SYNOPSIS

Get patch status for one or many computers

## SYNTAX

### __AllParameterSets

```
Get-PatchStatus [[-ComputerName] <string[]>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get patch status for one or many computers

## EXAMPLES

### EXAMPLE 1

Get-PatchStatus

### EXAMPLE 2

Get-PatchStatus -Computer localhost

Get patch status for the local computer

## PARAMETERS

### -ComputerName

Computers to check for patch status

```yaml
Type: System.String[]
DefaultValue: localhost
SupportsWildcards: false
Aliases:
- Computer
- Host
- Hostname
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: false
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

## RELATED LINKS

- [](https://github.com/mriechmanbennett/security-admin-tools/)
