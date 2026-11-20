---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-YumPackages.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/20/2026
PlatyPS schema version: 2024-05-01
title: Get-YumPackages
---

# Get-YumPackages

## SYNOPSIS

Get yum packages

## SYNTAX

### __AllParameterSets

```
Get-YumPackages [[-Name] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Gets installed yum packages.
This remains useful for yum-only workflows, while `Get-LinuxPackages` provides the consolidated multi-manager view.

## EXAMPLES

### EXAMPLE 1

Get-YumPackages

Returns all yum packages

### EXAMPLE 2

Get-YumPackages -Name "vim"

Returns only the vim package

## PARAMETERS

### -Name

Package name to search for.
If not specified, all packages are returned.

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

yum is a package manager for RPM-based distributions, such as RHEL and CentOS.

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-YumPackages.md)
- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxPackages.md)
