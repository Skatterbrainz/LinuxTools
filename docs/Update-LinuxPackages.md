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

Update and upgrade Linux packages

## SYNTAX

### __AllParameterSets

```
Update-LinuxPackages [[-Type] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Update and upgrade Linux packages

## EXAMPLES

### EXAMPLE 1

Update-LinuxPackages

Updates all packages

### EXAMPLE 2

Update-LinuxPackages -Type "apt"

Updates only apt packages

## PARAMETERS

### -Type

Valid values are "apt", "snap", "flatpak", or "all".
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LinuxPackages.md)
