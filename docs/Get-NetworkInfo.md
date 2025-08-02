---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-NetworkInfo.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: Get-NetworkInfo
---

# Get-NetworkInfo

## SYNOPSIS

Get basic network information

## SYNTAX

### __AllParameterSets

```
Get-NetworkInfo [[-PublicResolver] <string>] [-IncludePublicIP] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get basic network information, including local IP address, default gateway, DNS servers, MAC address, and subnet mask.

## EXAMPLES

### EXAMPLE 1

Get-NetworkInfo

### EXAMPLE 2

Get-NetworkInfo -IncludePublicIP

### EXAMPLE 3

Get-NetworkInfo -IncludePublicIP -PublicResolver 'https://checkip.amazonaws.com'

## PARAMETERS

### -IncludePublicIP

Include the public IP address in the output

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

### -PublicResolver

URI to a public IP address resolver service

```yaml
Type: System.String
DefaultValue: http://ipconfig.me/ip
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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-NetworkInfo.md)
