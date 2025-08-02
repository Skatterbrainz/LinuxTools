---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultAudioPlayer.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: Get-DefaultAudioPlayer
---

# Get-DefaultAudioPlayer

## SYNOPSIS

Get the default audio player.

## SYNTAX

### __AllParameterSets

```
Get-DefaultAudioPlayer [[-audioPlayer] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function reads the ~/.config/mimeapps.list file to determine the default audio player.

## EXAMPLES

### EXAMPLE 1

Get-DefaultAudioPlayer
Returns the default audio player.

## PARAMETERS

### -audioPlayer

The default audio player.
If not provided, the function will attempt to determine it.

```yaml
Type: System.String
DefaultValue: ''
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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultAudioPlayer.md)
