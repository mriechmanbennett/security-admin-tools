---
document type: cmdlet
external help file: WindowsOSBuild-Help.xml
HelpUri: ''
Locale: en-US
Module Name: WindowsOSBuild
ms.date: 01/26/2026
PlatyPS schema version: 2024-05-01
title: Get-LatestOSBuild
---

# Get-LatestOSBuild

## SYNOPSIS

Gets Windows patch release information (Version, Build, Availability date, Hotpatch, Preview, Out-of-band, Servicing option, KB article, KB URL and Catalog URL) for Windows client and server versions.
Useful for scripting and automation purposes. Supports Windows 10 and Windows Server 2016 onwards. Supports Hotpatch on Windows 11, Windows Server 2022 and Windows Server 2025.

## SYNTAX

### __AllParameterSets

```
Get-LatestOSBuild [-OSVersion] <string> [[-LatestReleases] <string>] [[-OSName] <string>]
 [-BuildOnly] [-ExcludePreview] [-ExcludeOutOfBand] [-PreviewOnly] [-OutOfBandOnly]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Patch information retrieved from Microsoft Release Health / Update History pages and outputted in a usable format.
These sources are updated regularly by Microsoft AFTER new patches are released.
This means at times this info may not always be in sync with Windows Update.

## EXAMPLES

### EXAMPLE 1

Get-LatestOSBuild -OSName Win10 -OSVersion 22H2
Show all information on the latest available OS build for Windows 10 Version 22H2 in list format.

### EXAMPLE 2

Get-LatestOSBuild -OSName Win10 -OSVersion 22H2 -LatestReleases 2
Show all information on the latest 2 releases of OS builds for Windows 10 Version 22H2 in list format.

### EXAMPLE 3

Get-LatestOSBuild -OSName Win10 -OSVersion 22H2 -ExcludePreview -LatestReleases 2
Show all information on the latest 2 releases excluding preview of OS builds for Windows 10 Version 22H2 in list format.

### EXAMPLE 4

Get-LatestOSBuild -OSName Win10 -OSVersion 22H2 -ExcludeOutOfBand -LatestReleases 2
Show all information on the latest 2 releases excluding out-of-band of OS builds for Windows 10 Version 22H2 in list format.

### EXAMPLE 5

Get-LatestOSBuild -OSName Win10 -OSVersion 22H2 -PreviewOnly -LatestReleases 2
Show all information on the latest 2 preview releases of OS builds for Windows 10 Version 22H2 in list format.

### EXAMPLE 6

Get-LatestOSBuild -OSName Win10 -OSVersion 22H2 -OutOfBandOnly -LatestReleases 2
Show all information on the latest 2 out-of-band releases of OS builds for Windows 10 Version 22H2 in list format.

### EXAMPLE 7

Get-LatestOSBuild -OSName Win10 -OSVersion 22H2 -BuildOnly
Show only the latest available OS build for Windows 10 Version 22H2 in list format.

### EXAMPLE 8

Get-LatestOSBuild -OSName Win10 -OSVersion 22H2 -PreviewOnly -BuildOnly
Show only the latest available preview OS build for Windows 10 Version 22H2 in list format.

### EXAMPLE 9

Get-LatestOSBuild -OSName Win10 -OSVersion 22H2 -OutOfBandOnly -BuildOnly
Show only the latest available out-of-band OS build for for Windows 10 Version 22H2 in list format.

### EXAMPLE 10

Get-LatestOSBuild -OSName Win10 -OSVersion 22H2 | ConvertTo-Json
Show all information on the latest available OS build for Windows 10 Version 22H2 in json format.

### EXAMPLE 11

Get-LatestOSBuild -OSName Win10 -OSVersion 22H2 | ConvertTo-Json | Out-File .\Get-LatestOSBuild.json
Save the json format to a file on the latest available OS build for Windows 10 Version 22H2.

## PARAMETERS

### -BuildOnly

This parameter is optional.
Returns full build number/s only.

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

### -ExcludeOutOfBand

This parameter is optional.
Excludes out-of-band release/s.

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

### -ExcludePreview

This parameter is optional.
Excludes preview release/s.

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

### -LatestReleases

This parameter is optional.
Returns last x releases (where x is the number of releases you want to display).
Default value is 1.

```yaml
Type: System.String
DefaultValue: 1
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

### -OSName

This parameter is optional.
OS name you want to check.
Default value is Win10.
Accepted values:

Windows Client OS Names                    - Win10, Win11, Win11Hotpatch.
Windows Server OS Names                    - Server2016, Server2019, Server2022, Server2022Hotpatch, Server2025, Server2025Hotpatch, Server Semi-annual = ServerSAC.

```yaml
Type: System.String
DefaultValue: Win10
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -OSVersion

This parameter is mandatory.
OS version number you want to check.
Accepted values:

Windows Client OS Versions:
CB/CBB/SAC (Semi-Annual Channel)           - 1507, 1511, 1607, 1703, 1709, 1803, 1809, 1903, 1909, 2004, 20H2, 21H2, 22H2, 23H2, 24H2.
Win 10 LTSB/LTSC                           - 2015 = 1507, 2016 = 1607, 2019 = 1809, 2021 = 21H2.
Win 11 LTSC                                - 2024 = 24H2.

Window Server OS Versions:
SAC (Semi-Annual Channel)                  - 1709, 1803, 1809, 1903, 1909, 2004, 20H2.
LTSB/LTSC                                  - 2016 = 1607, 2019 = 1809, 2022 = 21H2, 2025 = 24H2.

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

### -OutOfBandOnly

This parameter is optional.
Returns out-of-band/s only.

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

### -PreviewOnly

This parameter is optional.
Returns preview release/s only.

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

Forked from 'Get-Windows10ReleaseInformation.ps1' created by Fredrik Wall.
https://github.com/FredrikWall/PowerShell/blob/master/Windows/Get-Windows10ReleaseInformation.ps1
Uses code adapted from 'Get-CurrentPatchInfo.ps1' created by Trevor Jones.
https://gist.githubusercontent.com/SMSAgentSoftware/79fb091a4b7806378fc0daa826dbfb47/raw/0f6b52cddf82b2aa836a813cf6bc910a52a48c9f/Get-CurrentPatchInfo.ps1


## RELATED LINKS

{{ Fill in the related links here }}

