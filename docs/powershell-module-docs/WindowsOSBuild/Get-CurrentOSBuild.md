---
document type: cmdlet
external help file: WindowsOSBuild-Help.xml
HelpUri: ''
Locale: en-US
Module Name: WindowsOSBuild
ms.date: 02/15/2026
PlatyPS schema version: 2024-05-01
title: Get-CurrentOSBuild
---

# Get-CurrentOSBuild

## SYNOPSIS

Gets the currently installed OS Build release information. Supports Windows 10 and Windows Server 2016 onwards. Supports Hotpatch on Windows 11 and Windows Server 2022.

## SYNTAX

### __AllParameterSets

```
Get-CurrentOSBuild [-Detailed] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Installed OS Build number or detailed information (Version, Build, Availability date, Hotpatch, Preview, Out-of-band, Servicing option, KB article, KB URL and Catalog URL).

## EXAMPLES

### EXAMPLE 1

Get-CurrentOSBuild
Show only the build number for the installed OS Build.

### EXAMPLE 2

Get-CurrentOSBuild -Detailed
Show detailed information for the installed OS Build.

## PARAMETERS

### -Detailed

This parameter is optional.
Returns detailed information about the installed OS Build.

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

{{ Fill in the related links here }}

