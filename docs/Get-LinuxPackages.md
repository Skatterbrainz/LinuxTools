---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxPackages.md
Locale: en-US
Module Name: linuxtools
ms.date: 09/27/2025
PlatyPS schema version: 2024-05-01
title: Get-LinuxPackages
---

# Get-LinuxPackages

## SYNOPSIS

Get Linux packages

## SYNTAX

### __AllParameterSets

```
Get-LinuxPackages [[-Type] <string>] [-Upgradable] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get Linux packages and basic configuration settings

## EXAMPLES

### EXAMPLE 1

Get-LinuxPackages

Returns all packages.
Same as Get-LinuxPackages -Type "all"

### EXAMPLE 2

Get-LinuxPackages -Type "flatpak"

Returns only flatpak packages

### EXAMPLE 3

Get-LinuxPackages -Type "apt" -Upgradable

Returns only upgradable apt packages

### EXAMPLE 4

Get-LinuxPackages -Type "snap"

Returns only snap packages

### EXAMPLE 5

Get-LinuxPackages -Type "dnf"

Returns only dnf packages

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

### -Upgradable

Only valid for "apt" type.
If present, returns only upgradable packages.

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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxPackages.md)
