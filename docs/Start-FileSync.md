---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://example.com/Start-FileSynchttps://github.com/Skatterbrainz/linuxtools/blob/master/docs/Start-FileSync.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: Start-FileSync
---

# Start-FileSync

## SYNOPSIS

Synchronizes files from a source directory to a destination directory.

## SYNTAX

### __AllParameterSets

```
Start-FileSync [-SourcePath] <string> [-DestinationPath] <string> [-Prune] [-ForceCopy]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function uses rsync to synchronize files from a source directory to a destination directory, with options for pruning and forced copying.

## EXAMPLES

### EXAMPLE 1

Start-FileSync -SourcePath "/var/www/html" -DestinationPath "/backup/html"
This example synchronizes files from the source directory to the destination directory without pruning.

### EXAMPLE 2

Start-FileSync -SourcePath "/var/www/html" -DestinationPath "/backup/html" -Prune
This example synchronizes files and prunes the destination directory, removing files that are not present in the source directory.

### EXAMPLE 3

Start-FileSync -SourcePath "/var/www/html" -DestinationPath "/backup/html" -ForceCopy
This example synchronizes files and forces the creation of the destination directory if it does not exist.

## PARAMETERS

### -DestinationPath

The path to the destination directory where files will be synchronized.

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

### -ForceCopy

Whether to force the creation of the destination directory if it does not exist.

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

### -Prune

Whether to prune files in the destination that are not present in the source directory.

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

The path to the source directory containing files to synchronize.

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

## RELATED LINKS

- [](https://example.com/Start-FileSynchttps://github.com/Skatterbrainz/linuxtools/blob/master/docs/Start-FileSync.md)
