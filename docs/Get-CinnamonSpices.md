---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonSpices.md
Locale: en-US
Module Name: linuxtools
ms.date: 09/27/2025
PlatyPS schema version: 2024-05-01
title: Get-CinnamonSpices
---

# Get-CinnamonSpices

## SYNOPSIS

Retrieves a list of installed Cinnamon spices

## SYNTAX

### __AllParameterSets

```
Get-CinnamonSpices [[-Name] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Retrieves a list of installed Cinnamon spices from the user's home directory

## EXAMPLES

### EXAMPLE 1

Get-CinnamonSpices
Retrieves a list of installed Cinnamon spices

### EXAMPLE 2

Get-CinnamonSpices -Name "Cinnamon-Spices-Applet"
Retrieves details for the specified spice

## PARAMETERS

### -Name

Name of the spice to retrieve details for.

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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonSpices.md)
