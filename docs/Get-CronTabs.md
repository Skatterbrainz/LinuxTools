---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CronTabs.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Get-CronTabs
---

# Get-CronTabs

## SYNOPSIS

Get the list of cron jobs. If a file is specified, it will return the contents of that file.

## SYNTAX

### __AllParameterSets

```
Get-CronTabs [[-CronTabFile] <string>] [[-Path] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function reads the contents of a cron file and returns the list of cron jobs.

## EXAMPLES

### EXAMPLE 1

Get-CronTabs -CronTabFile "mycronjob"
Returns the list of cron jobs in the file /etc/cron.d/mycronjob.

### EXAMPLE 2

Get-CronTabs
Returns the list of cron files in /etc/cron.d.

## PARAMETERS

### -CronTabFile

The name of the cron file to read.
If not provided, it will list all cron files in /etc/cron.d.

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

### -Path

The path to the cron files.
Default is /etc/cron.d.

```yaml
Type: System.String
DefaultValue: /etc/cron.d
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CronTabs.md)
