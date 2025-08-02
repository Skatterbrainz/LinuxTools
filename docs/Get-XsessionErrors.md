---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-XsessionErrors.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: Get-XsessionErrors
---

# Get-XsessionErrors

## SYNOPSIS

Get the contents of the ~/.xsession-errors file

## SYNTAX

### __AllParameterSets

```
Get-XsessionErrors [[-logPath] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get the contents of the ~/.xsession-errors file, which is a common location for error messages in Linux desktop environments.

## EXAMPLES

### EXAMPLE 1

Get-XsessionErrors
Returns the contents of the ~/.xsession-errors file.

## PARAMETERS

### -logPath

The path to the log file to be read.
Default is "~/.xsession-errors".

```yaml
Type: System.String
DefaultValue: ~/.xsession-errors
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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-XsessionErrors.md)
