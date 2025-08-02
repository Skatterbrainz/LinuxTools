---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Start-FireFoxProfile.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: Start-FireFoxProfile
---

# Start-FireFoxProfile

## SYNOPSIS

Starts a Firefox profile.

## SYNTAX

### __AllParameterSets

```
Start-FireFoxProfile [[-ProfileName] <string>] [-DefaultProfile] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Starts a Firefox profile.
If a profile name is not provided, the function will prompt for one.

## EXAMPLES

### EXAMPLE 1

Start-FireFoxProfile

Prompts user to select a profile from a list, and starts Firefox with the selected profile.

### EXAMPLE 2

Start-FireFoxProfile -ProfileName "Contoso"

Starts Firefox with the profile named "Contoso".

### EXAMPLE 3

Start-FireFoxProfile -DefaultProfile

Starts Firefox with the default profile.

## PARAMETERS

### -DefaultProfile

Indicates to start the default profile.

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

### -ProfileName

The name of the profile to start.
If not provided, the function will prompt for one, unless
the -DefaultProfile switch is used.

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

To view, manage or create Firefox profiles, use the "about:profiles" URL in Firefox.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Start-FireFoxProfile.md)
