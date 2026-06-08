---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SystemErrors.md
Locale: en-US
Module Name: linuxtools
ms.date: 06/07/2026
PlatyPS schema version: 2024-05-01
title: Get-SystemErrors
---

# Get-SystemErrors

## SYNOPSIS

Gets error events from common Linux log sources.

## SYNTAX

### __AllParameterSets

```
Get-SystemErrors [[-Source] <string>] [[-Since] <string>] [[-Severity] <string>] [[-Lines] <int>] [<CommonParameters>]
```

## DESCRIPTION

Aggregates error entries from journalctl, syslog, auth.log, and xsession logs.

## EXAMPLES

### EXAMPLE 1

Get-SystemErrors

Returns recent error entries from all available sources.

### EXAMPLE 2

Get-SystemErrors -Source journal -Since "-2h" -Severity warning -Lines 100

Returns journal errors for the last two hours.

## PARAMETERS

### -Source

Log source to query.
Valid values are "all", "journal", "syslog", "auth", or "xsession".

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

### -Since

Time window used by journalctl.

```yaml
Type: System.String
DefaultValue: -24h
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

### -Severity

Journal severity level filter.

```yaml
Type: System.String
DefaultValue: err
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

### -Lines

Maximum number of lines to return per source.

```yaml
Type: System.Int32
DefaultValue: 200
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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SystemErrors.md)