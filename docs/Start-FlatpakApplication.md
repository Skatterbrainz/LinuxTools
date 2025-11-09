---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: ''
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Start-FlatpakApplication
---

# Start-FlatpakApplication

## SYNOPSIS

Starts a Flatpak application by name or Application ID.

## SYNTAX

### __AllParameterSets

```
Start-FlatpakApplication [[-Name] <string>] [[-ApplicationID] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function allows you to start a Flatpak application installed on your system.
It can accept either the application name or the Application ID as parameters.
If neither parameter is provided, it will prompt you to select an application from a list.

## EXAMPLES

### EXAMPLE 1

Start-FlatpakApplication -Name "GIMP"
Starts the Flatpak application with the name "GIMP".

### EXAMPLE 2

Start-FlatpakApplication -ApplicationID "org.gimp.GIMP"
Starts the Flatpak application with the Application ID "org.gimp.GIMP".

### EXAMPLE 3

Start-FlatpakApplication
Prompts the user to select a Flatpak application from a list to start.

## PARAMETERS

### -ApplicationID

The Application ID of the Flatpak application to start.

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

### -Name

The name of the Flatpak application to start.

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

Requires Flatpak to be installed on the system.


## RELATED LINKS

{{ Fill in the related links here }}

