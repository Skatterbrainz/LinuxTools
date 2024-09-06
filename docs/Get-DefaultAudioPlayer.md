---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultAudioPlayer.md
schema: 2.0.0
---

# Get-DefaultAudioPlayer

## SYNOPSIS
Get the default audio player.

## SYNTAX

```
Get-DefaultAudioPlayer [[-audioPlayer] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function reads the ~/.config/mimeapps.list file to determine the default audio player.

## EXAMPLES

### EXAMPLE 1
```
Get-DefaultAudioPlayer
Returns the default audio player.
```

## PARAMETERS

### -audioPlayer
The default audio player.
If not provided, the function will attempt to determine it.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultAudioPlayer.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultAudioPlayer.md)

