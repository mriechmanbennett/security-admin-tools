---
document type: cmdlet
external help file: SecurityAdminTools.Utilities-Help.xml
HelpUri: https://github.com/mriechmanbennett/security-admin-tools/
Locale: en-US
Module Name: SecurityAdminTools.Utilities
ms.date: 01/25/2026
PlatyPS schema version: 2024-05-01
title: New-ModuleDocumentation
---

# New-ModuleDocumentation

## SYNOPSIS

Generates markdown documentation for every module recursively below a target directory.

## SYNTAX

### __AllParameterSets

```
New-ModuleDocumentation [[-ModulePath] <string>] [-Depth <int>] [-OutFile <string>] [-SeparateFiles]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Generates markdown documentation for every module recursively below a target directory.

## EXAMPLES

### EXAMPLE 1

New-ModuleDocumentation

### EXAMPLE 2

New-ModuleDocumentation -Depth 2 example\path\to\module.psm1

## PARAMETERS

### -Depth

Integer for how many directories deep to recursively search.
Default is four.

```yaml
Type: System.Int32
DefaultValue: 4
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

### -ModulePath

String relative or absolute path to a Module, or to a folder that contains modules below it.
Defaults to searching the current directory

```yaml
Type: System.String
DefaultValue: $PWD.ToString()
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

### -OutFile

String relative or absolute path to an output file.
Default is to create files with the module name or with the parent directory name in the current directory.

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

### -SeparateFiles

Switch parameter to produce one markdown file per module instead including all in one.
Default is to include all modules in the same document file.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
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
