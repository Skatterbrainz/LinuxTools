---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-FireFoxProfiles.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: Get-FireFoxProfiles
---

# Get-FireFoxProfiles

## SYNOPSIS

Get Firefox profiles from profiles.ini file.

## SYNTAX

### __AllParameterSets

```
Get-FireFoxProfiles [-DefaultProfile] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get Firefox profiles from profiles.ini file.
The function reads the profiles.ini file.
Then it filters out the non-profile keys and expands the path to full name.

## EXAMPLES

### EXAMPLE 1

Get-FireFoxProfiles

Get all Firefox profiles.

### EXAMPLE 2

Get-FireFoxProfiles -DefaultProfile

Get the default Firefox profile.

## PARAMETERS

### -DefaultProfile

Indicates to return the default profile.

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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-FireFoxProfiles.md)
