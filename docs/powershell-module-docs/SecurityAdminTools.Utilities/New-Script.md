---
document type: cmdlet
external help file: SecurityAdminTools.Utilities-Help.xml
HelpUri: https://github.com/mriechmanbennett/security-admin-tools/
Locale: en-US
Module Name: SecurityAdminTools.Utilities
ms.date: 02/18/2026
PlatyPS schema version: 2024-05-01
title: New-Script
---

# New-Script

## SYNOPSIS

Create new Powershell script file containing a basic template.

## SYNTAX

### __AllParameterSets

```
New-Script [[-ScriptNameOrPath] <string>] [-Synopsis <string>] [-Description <string>]
 [-Link <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Create new Powershell script file containing a basic template.
Takes a script name or a path to where the new script file should be created.
A path name should include the desired script file name itself.

## EXAMPLES

### EXAMPLE 1

New-Script
Creates a new script in the current directory with filler default options.

### EXAMPLE 2

New-Script Get-ExampleScript
Creates a new script in the current directory with the name Get-ExampleScript.ps1.

### EXAMPLE 3

New-Script Folder\Here\Get-ExampleScript.ps1
Creates a new script named Get-ExampleScript at the relative
path "Folder\Here\Get-ExampleScript.ps1"

## PARAMETERS

### -Description

String that populates the Description text.
Defaults to filler.

```yaml
Type: System.String
DefaultValue: Description for new script
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Link

String that populates the Link text.
Defaults to a generic URL.
If the variable $SAT2_Var.NewScriptLink is set, it will use that instead.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ScriptNameOrPath

First position argument, takes a string with the desired script name or a path
for the new script file.
Path can be relative or absolute.

```yaml
Type: System.String
DefaultValue: New-ExampleScript
SupportsWildcards: false
Aliases: []
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

### -Synopsis

String that populates the Synopsis text.
Defaults to filler.

```yaml
Type: System.String
DefaultValue: Synopsis for new script
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
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
