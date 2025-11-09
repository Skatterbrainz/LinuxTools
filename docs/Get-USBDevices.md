---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-USBDevices.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Get-USBDevices
---

# Get-USBDevices

## SYNOPSIS

Get a list of USB devices.

## SYNTAX

### __AllParameterSets

```
Get-USBDevices [-ShowVerbose] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get a list of USB devices.
This function uses the `lsusb` command to retrieve information about connected USB devices and organizes it into a structured format.

## EXAMPLES

### EXAMPLE 1

Get-USBDevices
Returns a list of connected USB devices with their details.

### EXAMPLE 2

Get-USBDevices -ShowVerbose
Returns a list of connected USB devices with verbose output during processing.

## PARAMETERS

### -ShowVerbose

Whether to show verbose output during processing.

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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-USBDevices.md)
