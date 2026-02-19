---
document type: cmdlet
external help file: SecurityAdminTools.WindowsDefenderConfigurationManagement-Help.xml
HelpUri: https://github.com/mriechmanbennett/security-admin-tools/
Locale: en-US
Module Name: SecurityAdminTools.WindowsDefenderConfigurationManagement
ms.date: 02/18/2026
PlatyPS schema version: 2024-05-01
title: Get-AVExclusion
---

# Get-AVExclusion

## SYNOPSIS

Get Defender AV exclusions from a computer

## SYNTAX

### __AllParameterSets

```
Get-AVExclusion [[-ComputerName] <string[]>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get Defender AV exclusions from a computer

## EXAMPLES

### EXAMPLE 1

Get-AVExclusion

### EXAMPLE 2

Get-AVExclusion -ComputerName remote-host

Gets configuration from computer named 'remote-host'

## PARAMETERS

### -ComputerName

Computers from which to retrieve configuration

```yaml
Type: System.String[]
DefaultValue: $env:COMPUTERNAME
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: false
  ValueFromPipeline: true
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

### System.String[]

{{ Fill in the Description }}

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/mriechmanbennett/security-admin-tools/)
