---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-NeoFetchConfig.md
Locale: en-US
Module Name: linuxtools
ms.date: 10/03/2026
PlatyPS schema version: 2024-05-01
title: Get-NeoFetchConfig
---

# Get-NeoFetchConfig

## SYNOPSIS

Gets enabled/disabled `info` entries from NeoFetch configuration.

## SYNTAX

### __AllParameterSets

```powershell
Get-NeoFetchConfig [<CommonParameters>]
```

## DESCRIPTION

Reads `~/.config/neofetch/config.conf` and returns configuration items declared with `info` or
commented `# info` lines.

Each output object contains:
- `Name`
- `Enabled`

## EXAMPLES

### EXAMPLE 1

```powershell
Get-NeoFetchConfig
```

Returns all parsed NeoFetch info items and whether each is enabled.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSCustomObject

## NOTES

Writes an error if NeoFetch config is not found.

## RELATED LINKS

- [Get-NeoFetchConfig source](https://github.com/Skatterbrainz/linuxtools/blob/master/public/Get-NeoFetchConfig.ps1)
