---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AptPackages.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Get-AptPackages
---

# Get-AptPackages

## SYNOPSIS

Get a list of installed APT packages

## SYNTAX

### __AllParameterSets

```
Get-AptPackages [-Upgradeable] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get a list of installed APT packages

## EXAMPLES

### EXAMPLE 1

Get-AptPackages
Lists all installed APT packages

### EXAMPLE 2

Get-AptPackages -Upgradeable
Lists only upgradable APT packages

## PARAMETERS

### -Upgradeable

Whether to list only upgradable packages

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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AptPackages.md)
