---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AutoStartApps.md
Locale: en-US
Module Name: linuxtools
ms.date: 09/27/2025
PlatyPS schema version: 2024-05-01
title: Get-AutoStartApps
---

# Get-AutoStartApps

## SYNOPSIS

Get a list of applications set to auto-start on login

## SYNTAX

### __AllParameterSets

```
Get-AutoStartApps [[-Name] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get a list of applications set to auto-start on login

## EXAMPLES

### EXAMPLE 1

Get-AutoStartApps
Returns a list of applications set to auto-start on login

### EXAMPLE 2

Get-AutoStartApps -Name "firefox.desktop"
Returns the desktop file for the specified application

## PARAMETERS

### -Name

{{ Fill Name Description }}

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

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AutoStartApps.md)
