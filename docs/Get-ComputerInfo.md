---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ComputerInfo.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Get-ComputerInfo
---

# Get-ComputerInfo

## SYNOPSIS

Get basic computer and operating system info

## SYNTAX

### __AllParameterSets

```
Get-ComputerInfo [-NeoFetch] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Compatibility wrapper for `Get-SystemInfo`.
By default, this command returns detailed system information.

## EXAMPLES

### EXAMPLE 1

Get-ComputerInfo

Returns detailed system information.

### EXAMPLE 2

Get-ComputerInfo -NeoFetch

Runs neofetch and returns its output.

## PARAMETERS

### -NeoFetch

Optional.
Use the NeoFetch command to display system information.

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

Use `Get-SystemInfo -Detail Basic` for a lighter output object.

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ComputerInfo.md)
- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SystemInfo.md)
