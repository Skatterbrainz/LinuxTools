---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxPackages.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Get-LinuxPackages
---

# Get-LinuxPackages

## SYNOPSIS

Get installed packages from one or more Linux package managers.

## SYNTAX

### __AllParameterSets

```
Get-LinuxPackages [[-Type] <string>] [-Upgradable] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Returns installed package inventory from APT, Snap, Flatpak, DNF, or all available package managers.
When `-Type all` is used, the command only queries package managers that are installed on the current system.

## EXAMPLES

### EXAMPLE 1

Get-LinuxPackages

Returns all packages.
Same as Get-LinuxPackages -Type "all"

When `-Type all` is used, only package managers available on the local system are queried.

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

### EXAMPLE 6

Get-LinuxPackages -Type all | Group-Object SourceType

Returns installed packages grouped by package manager.

## PARAMETERS

### -Type

Valid values are "apt", "snap", "flatpak", "dnf" or "all".
Default is "all".

When `all` is used, unavailable package managers are skipped.

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
If present, returns only upgradable APT packages.

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

The returned objects include a `SourceType` property so results from multiple package managers can be combined safely.

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxPackages.md)
- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-PackageUpdates.md)
