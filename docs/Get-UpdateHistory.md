---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-UpdateHistory.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/20/2026
PlatyPS schema version: 2024-05-01
title: Get-UpdateHistory
---

# Get-UpdateHistory

## SYNOPSIS

Retrieves the update history from package manager logs and history commands.

## SYNTAX

### __AllParameterSets

```
Get-UpdateHistory [[-SearchPattern] <string>] [[-StartDate] <datetime>] [[-EndDate] <datetime>] [-IncludeArchived] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Retrieves and parses update history events from package manager logs and history commands,
optionally filtered by search pattern, start date, end date, and whether to include archived logs.

Supported managers include apt, zypper, snap, dnf, yum, and flatpak.
For yum, this cmdlet uses `sudo yum history list` and parses transaction output.

## EXAMPLES

### EXAMPLE 1

Get-UpdateHistory -SearchPattern "libnfs14" -StartDate "2026-11-01" -EndDate "2026-11-30"

Retrieves update history entries containing "libnfs14" between the specified dates.

### EXAMPLE 2

Get-UpdateHistory -IncludeArchived

Retrieves all parsed update history events, including archived apt log data.

## PARAMETERS

### -SearchPattern

Optional string used to filter history entries by matching text in raw event output.

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

### -StartDate

Optional start date filter.
Only events with parsed start dates on or after this value are returned.

```yaml
Type: System.DateTime
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

### -EndDate

Optional end date filter.
Only events with parsed start dates on or before this value are returned.

```yaml
Type: System.DateTime
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

### -IncludeArchived

Switch to include archived apt history logs where available.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

Filtering by `-StartDate` and `-EndDate` applies to parsed event dates when available.

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-UpdateHistory.md)
