---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-RpmPackages.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/20/2026
PlatyPS schema version: 2024-05-01
title: Get-RpmPackages
---

# Get-RpmPackages

## SYNOPSIS

Retrieves a list of installed RPM packages.

## SYNTAX

### __AllParameterSets

```
Get-RpmPackages [[-Name] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Queries the system for installed RPM packages and returns package details.
Use `-Name` to filter the result set by package name.

## EXAMPLES

### EXAMPLE 1

Get-RpmPackages

Retrieves all installed RPM packages.

### EXAMPLE 2

Get-RpmPackages -Name "bash"

Retrieves installed RPM packages matching "bash".

## PARAMETERS

### -Name

Optional package name filter.

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

Requires the `rpm` command to be available on the host system.

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-RpmPackages.md)
