---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DesktopThemes.md
Locale: en-US
Module Name: linuxtools
ms.date: 10/03/2026
PlatyPS schema version: 2024-05-01
title: Get-DesktopThemes
---

# Get-DesktopThemes

## SYNOPSIS

Retrieves installed desktop themes for Cinnamon/GNOME and KDE-style environments.

## SYNTAX

### __AllParameterSets

```powershell
Get-DesktopThemes [<CommonParameters>]
```

## DESCRIPTION

Searches common theme locations and returns discovered theme metadata:

- `~/.themes` (Cinnamon/GNOME style `info.json`)
- `~/.local/share` (KDE style `*.desktop` metadata)

## EXAMPLES

### EXAMPLE 1

```powershell
Get-DesktopThemes
```

Returns available theme metadata objects from supported directories.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSCustomObject

Theme metadata objects from discovered theme sources.

## NOTES

If no known theme directories are present, the command writes a warning.

## RELATED LINKS

- [Get-DesktopThemes source](https://github.com/Skatterbrainz/linuxtools/blob/master/public/Get-DesktopThemes.ps1)
