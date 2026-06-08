---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonSpices.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Get-CinnamonSpices
---

# Get-CinnamonSpices

## SYNOPSIS

Retrieves Cinnamon spices, applets, or extensions.

## SYNTAX

### __AllParameterSets

```
Get-CinnamonSpices [[-Type] <string>] [[-Name] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Retrieves Cinnamon components from the user's home directory.
By default it returns Cinnamon spices, but it can also return applets, extensions, or all supported component types.

## EXAMPLES

### EXAMPLE 1

Get-CinnamonSpices
Retrieves a list of installed Cinnamon spices

### EXAMPLE 2

Get-CinnamonSpices -Type applets
Retrieves installed Cinnamon applets

### EXAMPLE 3

Get-CinnamonSpices -Name "Cinnamon-Spices-Applet"
Retrieves details for the specified spice

### EXAMPLE 4

Get-CinnamonSpices -Type all
Retrieves all available Cinnamon component types

## PARAMETERS

### -Type

Component type to return.
Valid values are "spices", "applets", "extensions" or "all".

```yaml
Type: System.String
DefaultValue: spices
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

### -Name

Name of the component to retrieve details for.

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

`Get-CinnamonApplets` and `Get-CinnamonExtensions` are compatibility wrappers over this command.

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonSpices.md)
- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonApplets.md)
- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonExtensions.md)
