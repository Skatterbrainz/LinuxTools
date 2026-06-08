---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Test-SystemHealth.md
Locale: en-US
Module Name: linuxtools
ms.date: 06/07/2026
PlatyPS schema version: 2024-05-01
title: Test-SystemHealth
---

# Test-SystemHealth

## SYNOPSIS

Runs a consolidated Linux system health check.

## SYNTAX

### __AllParameterSets

```
Test-SystemHealth [[-WarningDiskPercent] <int>] [[-WarningMemoryPressure] <int>] [<CommonParameters>]
```

## DESCRIPTION

Collects health indicators from disk, memory, failed services, package updates, and reboot state.
Returns the summary score and status together with top-level detail properties for each check.

## EXAMPLES

### EXAMPLE 1

Test-SystemHealth

Returns a health summary object for the local system, including disk, memory, service,
update, and reboot detail fields.

## PARAMETERS

### -WarningDiskPercent

Disk usage threshold considered warning level.

```yaml
Type: System.Int32
DefaultValue: 85
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

### -WarningMemoryPressure

Memory pressure threshold considered warning level.

```yaml
Type: System.Int32
DefaultValue: 60
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

Returns a PSCustomObject with HealthScore, Status, MaxDiskPercent,
MemoryPressureAvg10, FailedServices, PendingUpdates, RebootPending,
WarningCount, Warnings, and Checks properties.

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Test-SystemHealth.md)