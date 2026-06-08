---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LinuxPackages.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Update-LinuxPackages
---

# Update-LinuxPackages

## SYNOPSIS

Update packages using one or more Linux package managers.

## SYNTAX

### __AllParameterSets

```
Update-LinuxPackages [[-Type] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Updates packages using APT, Snap, Flatpak, DNF, or all available package managers.
When `-Type all` is used, the command only runs against package managers installed on the current system.

## EXAMPLES

### EXAMPLE 1

Update-LinuxPackages

Updates all packages

When `-Type all` is used, unavailable package managers are skipped.

### EXAMPLE 2

Update-LinuxPackages -Type "apt"

Updates only apt packages

### EXAMPLE 3

Update-LinuxPackages -Type dnf

Updates only DNF packages.

## PARAMETERS

### -Type

Valid values are "apt", "snap", "flatpak", "dnf", or "all".
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

This command performs package manager updates and may require elevated permissions.

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LinuxPackages.md)
- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-PackageUpdates.md)
