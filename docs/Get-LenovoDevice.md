---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LenovoDevice.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: Get-LenovoDevice
---

# Get-LenovoDevice

## SYNOPSIS

Get Lenovo device information

## SYNTAX

### __AllParameterSets

```
Get-LenovoDevice [[-SerialNumber] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get Lenovo device information using the Lenovo API.

## EXAMPLES

### EXAMPLE 1

Get-LenovoDevice

### EXAMPLE 2

Get-LenovoDevice -SerialNumber "1234567890"

## PARAMETERS

### -SerialNumber

Optional.
Specify the serial number of the Lenovo device.
If not specified, the script will attempt to retrieve it from the system.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

Inspired by Damien Van Robaeys' blog post: https://www.vansurksum.com/2021/02/08/get-lenovo-warranty-information-using-powershell/


## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LenovoDevice.md)
