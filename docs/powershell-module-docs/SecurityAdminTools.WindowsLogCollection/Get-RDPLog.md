---
document type: cmdlet
external help file: SecurityAdminTools.WindowsLogCollection-Help.xml
HelpUri: https://github.com/mriechmanbennett/security-admin-tools/
Locale: en-US
Module Name: SecurityAdminTools.WindowsLogCollection
ms.date: 02/18/2026
PlatyPS schema version: 2024-05-01
title: Get-RDPLog
---

# Get-RDPLog

## SYNOPSIS

Pull RDP logs from a computer

## SYNTAX

### __AllParameterSets

```
Get-RDPLog [[-Limit] <int>] [[-Computer] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Pull RDP logs from a computer

## EXAMPLES

### EXAMPLE 1

Get-RDPLog

### EXAMPLE 2

Get-RDPLog -Computer remote-host

Gets logs from computer named 'remote-host'

## PARAMETERS

### -Computer

Computer from which to retrieve logs.
Defaults to the local device

```yaml
Type: System.String
DefaultValue: $env:COMPUTERNAME
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Limit

Specify the number of most recent results to return

```yaml
Type: System.Int32
DefaultValue: 0
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
