---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ProcessList.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Get-ProcessList
---

# Get-ProcessList

## SYNOPSIS

Get-ProcessList retrieves a list of processes

## SYNTAX

### Detailed

```
Get-ProcessList [-Top <int>] [-Detailed] [-ProcessName <string>] [-PortNumber <int>]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get-ProcessList retrieves a list of processes and sorts them by CPU usage in descending order

## EXAMPLES

### EXAMPLE 1

Get-ProcessList

Get-ProcessList retrieves a list of processes and sorts them by CPU usage in descending order

### EXAMPLE 2

Get-ProcessList -Top 5

Get-ProcessList retrieves a list of the top 5 processes sorted by CPU usage in descending order

### EXAMPLE 3

Get-ProcessList -Detailed

Get-ProcessList retrieves detailed information about all processes

### EXAMPLE 4

Get-ProcessList -Detailed -ProcessName 'nginx'

Get-ProcessList retrieves detailed information about the 'nginx' process

### EXAMPLE 5

Get-ProcessList -Detailed -PortNumber 443

Get-ProcessList retrieves detailed information about processes using port 443

## PARAMETERS

### -Detailed

Retrieves detailed information about processes.
If specified, you can also filter by ProcessName or PortNumber

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Detailed
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -PortNumber

Port number to filter processes by when Detailed is specified

```yaml
Type: System.Int32
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Detailed
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ProcessName

Name of the process to filter by when Detailed is specified

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Detailed
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Top

Top number of processes to display.
Default is 10

```yaml
Type: System.Int32
DefaultValue: 10
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

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ProcessList.md)
