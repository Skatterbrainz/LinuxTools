---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-PackageUpdates.md
Locale: en-US
Module Name: linuxtools
ms.date: 06/07/2026
PlatyPS schema version: 2024-05-01
title: Get-PackageUpdates
---

# Get-PackageUpdates

## SYNOPSIS

Gets pending package updates without installing them.

## SYNTAX

### __AllParameterSets

```
Get-PackageUpdates [[-Type] <string>] [-Summary] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Queries supported package managers for pending updates and returns structured objects.
When `-Type all` is used, only available package managers are queried.

## EXAMPLES

### EXAMPLE 1

Get-PackageUpdates

Returns pending updates from all available package managers.

### EXAMPLE 2

Get-PackageUpdates -Type apt

Returns pending APT updates.

### EXAMPLE 3

Get-PackageUpdates -Summary

Returns one row per available package manager with pending update counts.

## PARAMETERS

### -Type

Valid values are "apt", "snap", "flatpak", "dnf" or "all".
Default is "all".

```yaml
Type: System.String
DefaultValue: all
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

### -Summary

Returns a summary count per package manager instead of one row per package.

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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-PackageUpdates.md)