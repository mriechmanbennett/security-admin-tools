---
document type: cmdlet
external help file: SecurityAdminTools.Utilities-Help.xml
HelpUri: https://github.com/mriechmanbennett/security-admin-tools/
Locale: en-US
Module Name: SecurityAdminTools.Utilities
ms.date: 02/18/2026
PlatyPS schema version: 2024-05-01
title: Rename-ModuleDirectory
---

# Rename-ModuleDirectory

## SYNOPSIS

Rename a module directory created with New-ModuleDirectory

## SYNTAX

### __AllParameterSets

```
Rename-ModuleDirectory [-Path] <string> [-NewName] <string> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Rename a module directory created with New-ModuleDirectory
Takes a path to the module directory
Updates the folder and file names and updates the module name within files.

## EXAMPLES

### EXAMPLE 1

Rename-ModuleDirectory Test-Module

## PARAMETERS

### -NewName

{{ Fill NewName Description }}

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

Example parameter

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
