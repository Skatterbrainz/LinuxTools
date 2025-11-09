---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AppLaunchers.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Get-AppLaunchers
---

# Get-AppLaunchers

## SYNOPSIS

Get the application launchers on the system.

## SYNTAX

### __AllParameterSets

```
Get-AppLaunchers [[-Scope] <string>] [[-Name] <string>] [-Contents] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function gets the application launchers on the system.

## EXAMPLES

### EXAMPLE 1

Get-AppLaunchers

Get all application launchers on the system for the current user.

### EXAMPLE 2

Get-AppLaunchers -Scope System

Get all application launchers on the system for all users.

### EXAMPLE 3

Get-AppLaunchers -Name Firefox

Get the application launcher for Firefox for the current user.

### EXAMPLE 4

Get-AppLaunchers -Name Firefox -Contents

Get the contents of the application launcher for Firefox for the current user.

## PARAMETERS

### -Contents

If Name is provided, this returns the contents of the matching application launchers.

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

### -Name

The name of the application launcher to get.
If not specified, all application launchers are returned.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Scope

The scope of the application launchers to get.
The default is "User".

```yaml
Type: System.String
DefaultValue: User
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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AppLaunchers.md)
