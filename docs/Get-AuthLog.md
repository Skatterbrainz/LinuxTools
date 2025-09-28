---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AuthLog.md
Locale: en-US
Module Name: linuxtools
ms.date: 09/27/2025
PlatyPS schema version: 2024-05-01
title: Get-AuthLog
---

# Get-AuthLog

## SYNOPSIS

Parses the authentication log file and returns structured data.

## SYNTAX

### __AllParameterSets

```
Get-AuthLog [[-Path] <string>] [[-Filter] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Parses the authentication log file located at /var/log/auth.log (or a specified path) and returns structured data.
You can filter the log entries by providing a filter string.

## EXAMPLES

### EXAMPLE 1

Get-AuthLog -Path "/var/log/auth.log" -Filter "pam_unix"
This example retrieves all log entries from the authentication log that contain the string "pam_unix".

### EXAMPLE 2

Get-AuthLog
This example retrieves all log entries from the default authentication log file "/var/log/auth.log".

## PARAMETERS

### -Filter

A filter string to match against the log entries.
Only entries that match this filter will be returned.

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

The path to the authentication log file.
Default is "/var/log/auth.log".

```yaml
Type: System.String
DefaultValue: /var/log/auth.log
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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AuthLog.md)
