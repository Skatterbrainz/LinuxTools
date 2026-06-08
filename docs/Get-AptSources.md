---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AptSources.md
Locale: en-US
Module Name: linuxtools
ms.date: 06/07/2026
PlatyPS schema version: 2024-05-01
title: Get-AptSources
---

# Get-AptSources

## SYNOPSIS

Gets configured APT repository sources.

## SYNTAX

### __AllParameterSets

```
Get-AptSources [<CommonParameters>]
```

## DESCRIPTION

Parses `/etc/apt/sources.list` and `/etc/apt/sources.list.d/*.list` entries and returns active repository lines.

## EXAMPLES

### EXAMPLE 1

Get-AptSources

Returns configured apt source entries.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AptSources.md)