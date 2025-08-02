---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-YouTubeAudio.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: Get-YouTubeAudio
---

# Get-YouTubeAudio

## SYNOPSIS

Downloads audio from a YouTube video using yt-dlp.

## SYNTAX

### __AllParameterSets

```
Get-YouTubeAudio [-URL] <string> [[-OutputPath] <string>] [[-NewName] <string>]
 [[-ytdlpPath] <string>] [[-ytdlpOptions] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Downloads audio from a YouTube video using yt-dlp.
The audio is saved as an MP3 file in the specified output path.

## EXAMPLES

### EXAMPLE 1

Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id"
Downloads the audio from the YouTube video with the specified video ID.

### EXAMPLE 2

Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id" -OutputPath "~/Music"
Exported list of pending updates for non-AVD machines. Only two items appear this week. Both are related to ASP.NET core, or .NET framework, and both are on machine WVMAFSQ01.

### EXAMPLE 3

Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id" -OutputPath "~/Music" -NewName "my_audio"
Downloads the audio from the YouTube video with the specified video ID and saves it as "my_audio.m4a" in the specified output path.

### EXAMPLE 4

Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id" -OutputPath "~/Music" -ytdlpOptions "-f 139"
Downloads the audio from the YouTube video with the specified video ID using the specified yt-dlp options.

## PARAMETERS

### -NewName

The new name of the audio file.
The default value is the original name of the audio file.

```yaml
Type: System.String
DefaultValue: ''
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

### -OutputPath

The path where the audio file will be saved.
The default value is ~/Downloads.

```yaml
Type: System.String
DefaultValue: ~/Downloads
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

### -URL

The URL of the YouTube video.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ytdlpOptions

The options to pass to yt-dlp.
The default value is "-f bestaudio --extract-audio --audio-format m4a".

```yaml
Type: System.String
DefaultValue: -f bestaudio --extract-audio --audio-format m4a
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 4
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ytdlpPath

The path to the yt-dlp executable.
The default value is /usr/bin/yt-dlp.

```yaml
Type: System.String
DefaultValue: /usr/bin/yt-dlp
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 3
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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-YouTubeAudio.md)
