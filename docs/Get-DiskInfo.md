---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DiskInfo.md
Locale: en-US
Module Name: linuxtools
ms.date: 09/27/2025
PlatyPS schema version: 2024-05-01
title: Get-DiskInfo
---

# Get-DiskInfo

## SYNOPSIS

Get local disk information

## SYNTAX

### __AllParameterSets

```
Get-DiskInfo [-FormatNumbers]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get local disk information using the "df" command.

## EXAMPLES

### EXAMPLE 1

Get-DiskInfo
Enumerate all local disk information

### EXAMPLE 2

Get-DiskInfo -FormatNumbers
Enumerate all local disk information with formatted numbers

## PARAMETERS

### -FormatNumbers

Return number values in units (e.g.
12GB, 1.2TB, etc.)

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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DiskInfo.md)
