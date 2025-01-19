---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-YouTubeAudio.md
schema: 2.0.0
---

# Get-YouTubeAudio

## SYNOPSIS
Downloads audio from a YouTube video using yt-dlp.

## SYNTAX

```
Get-YouTubeAudio [-URL] <String> [[-OutputPath] <String>] [[-NewName] <String>] [[-ytdlpPath] <String>]
 [[-ytdlpOptions] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Downloads audio from a YouTube video using yt-dlp.
The audio is saved as an MP3 file in the specified output path.

## EXAMPLES

### EXAMPLE 1
```
Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id"
Downloads the audio from the YouTube video with the specified video ID.
```

### EXAMPLE 2
```
Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id" -OutputPath "~/Music"
Exported list of pending updates for non-AVD machines. Only two items appear this week. Both are related to ASP.NET core, or .NET framework, and both are on machine WVMAFSQ01.
```

### EXAMPLE 3
```
Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id" -OutputPath "~/Music" -NewName "my_audio"
Downloads the audio from the YouTube video with the specified video ID and saves it as "my_audio.m4a" in the specified output path.
```

### EXAMPLE 4
```
Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id" -OutputPath "~/Music" -ytdlpOptions "-f 139"
Downloads the audio from the YouTube video with the specified video ID using the specified yt-dlp options.
```

## PARAMETERS

### -URL
The URL of the YouTube video.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputPath
The path where the audio file will be saved.
The default value is ~/Downloads.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: ~/Downloads
Accept pipeline input: False
Accept wildcard characters: False
```

### -NewName
The new name of the audio file.
The default value is the original name of the audio file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ytdlpPath
The path to the yt-dlp executable.
The default value is /usr/bin/yt-dlp.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: /usr/bin/yt-dlp
Accept pipeline input: False
Accept wildcard characters: False
```

### -ytdlpOptions
The options to pass to yt-dlp.
The default value is "-f bestaudio --extract-audio --audio-format m4a".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: -f bestaudio --extract-audio --audio-format m4a
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-YouTubeAudio.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-YouTubeAudio.md)

