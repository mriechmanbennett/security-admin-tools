---
document type: cmdlet
external help file: SecurityAdminTools.Utilities-Help.xml
HelpUri: https://github.com/mriechmanbennett/security-admin-tools/
Locale: en-US
Module Name: SecurityAdminTools.Utilities
ms.date: 02/18/2026
PlatyPS schema version: 2024-05-01
title: Rename-Script
---

# Rename-Script

## SYNOPSIS

Rename an existing script file created with New-Script

## SYNTAX

### __AllParameterSets

```
Rename-Script [-Path] <string> [-NewName] <string> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Rename an existing script file created with New-Script

## EXAMPLES

### EXAMPLE 1

Rename-Script Old-Name.ps1 New-Name.ps1

## PARAMETERS

### -NewName

New name for the script/cmdlet

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Path

Path of the script file to rename

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

## RELATED LINKS

- [](https://github.com/mriechmanbennett/security-admin-tools/)
