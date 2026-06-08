---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultApplication.md
Locale: en-US
Module Name: linuxtools
ms.date: 06/07/2026
PlatyPS schema version: 2024-05-01
title: Get-DefaultApplication
---

# Get-DefaultApplication

## SYNOPSIS

Gets default applications from mimeapps.list.

## SYNTAX

### __AllParameterSets

```
Get-DefaultApplication [[-Category] <string>] [[-MimeType] <string>] [[-Path] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Reads `~/.config/mimeapps.list` and returns default application mappings by category or MIME type.

## EXAMPLES

### EXAMPLE 1

Get-DefaultApplication -Category browser

Returns default browser mappings.

### EXAMPLE 2

Get-DefaultApplication -MimeType "audio/*"

Returns defaults for audio MIME types.

## PARAMETERS

### -Category

Category to query.
Valid values are "browser", "audio", "video", "image", "text", or "all".

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

### -MimeType

Optional MIME type wildcard filter, for example "audio/*".

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Path

Optional path to a mimeapps.list file.

```yaml
Type: System.String
DefaultValue: ~/.config/mimeapps.list
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
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

`Get-DefaultBrowser` and `Get-DefaultAudioPlayer` are compatibility wrappers over this command.

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultApplication.md)
- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultBrowser.md)
- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultAudioPlayer.md)