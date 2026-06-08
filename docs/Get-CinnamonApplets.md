---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonApplets.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Get-CinnamonApplets
---

# Get-CinnamonApplets

## SYNOPSIS

Retrieves a list of installed Cinnamon applets

## SYNTAX

### __AllParameterSets

```
Get-CinnamonApplets [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Retrieves a list of installed Cinnamon applets from the user's home directory.
This command is now a thin wrapper over the shared Cinnamon component reader used by `Get-CinnamonSpices`.

## EXAMPLES

### EXAMPLE 1

Get-CinnamonApplets
Retrieves a list of installed Cinnamon applets

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

For a unified Cinnamon component query surface, use `Get-CinnamonSpices -Type applets`.

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonApplets.md)
- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonSpices.md)
