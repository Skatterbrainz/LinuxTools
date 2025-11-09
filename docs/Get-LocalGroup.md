---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LocalGroup.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Get-LocalGroup
---

# Get-LocalGroup

## SYNOPSIS

Get local groups

## SYNTAX

### __AllParameterSets

```
Get-LocalGroup [[-Name] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get local security groups

## EXAMPLES

### EXAMPLE 1

Get-LocalGroup

Returns a list of all local groups on the system in tabular format.

### EXAMPLE 2

Get-LocalGroup -Name "lpadmin"

Returns details for the "lpadmin" group on the local system in tabular format.

Name    ID  Members  Computer
----    --  -------  --------
lpadmin 105 {user42} mint22

## PARAMETERS

### -Name

Optional.
Name of group to return.
Default is to return all groups.

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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LocalGroup.md)
