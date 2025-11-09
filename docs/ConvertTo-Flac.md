---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: ''
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: ConvertTo-Flac
---

# ConvertTo-Flac

## SYNOPSIS

Converts audio files to FLAC format using ffmpeg.

## SYNTAX

### __AllParameterSets

```
ConvertTo-Flac [-SourcePath] <string> [-DestinationPath] <string> [[-fileTypes] <string>]
 [-Overwrite] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function takes a source directory containing audio files and converts them to FLAC format, saving them in the specified destination directory.

## EXAMPLES

### EXAMPLE 1

ConvertTo-Flac -SourcePath "C:\Music\ToConvert" -DestinationPath "C:\Music\FLAC" -fileTypes "mp3,wav" -Overwrite
Converts all mp3 and wav files in "C:\Music\ToConvert" to FLAC format and saves them in "C:\Music\FLAC", overwriting any existing FLAC files.

## PARAMETERS

### -DestinationPath

The path to the destination directory where converted FLAC files will be saved.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -fileTypes

A comma-separated list of audio file extensions to convert (default: "mp3,wav,aac,ogg,m4a").

```yaml
Type: System.String
DefaultValue: mp3,wav,aac,ogg,m4a
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

### -Overwrite

Switch to overwrite existing FLAC files in the destination directory.

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

### -SourcePath

The path to the source directory containing audio files to be converted.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

Requires ffmpeg to be installed and accessible in the system PATH.


## RELATED LINKS

{{ Fill in the related links here }}

