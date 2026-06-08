---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-NetworkConnections.md
Locale: en-US
Module Name: linuxtools
ms.date: 06/07/2026
PlatyPS schema version: 2024-05-01
title: Get-NetworkConnections
---

# Get-NetworkConnections

## SYNOPSIS

Gets listening and active network socket connections.

## SYNTAX

### __AllParameterSets

```
Get-NetworkConnections [-ListeningOnly] [<CommonParameters>]
```

## DESCRIPTION

Uses `ss` to return listening and active sockets with process details when available.

## EXAMPLES

### EXAMPLE 1

Get-NetworkConnections

Returns network sockets.

### EXAMPLE 2

Get-NetworkConnections -ListeningOnly

Returns listening sockets only.

## PARAMETERS

### -ListeningOnly

If present, returns listening sockets only.

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

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-NetworkConnections.md)