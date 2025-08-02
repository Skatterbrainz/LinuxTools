---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalGroup.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: New-LocalGroup
---

# New-LocalGroup

## SYNOPSIS

Create a new local group

## SYNTAX

### __AllParameterSets

```
New-LocalGroup [-Name] <string> [-GroupID] <int> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Create a new local security group

## EXAMPLES

### EXAMPLE 1

New-LocalGroup -Name "mygroup"
Creates a new local group named "mygroup"

### EXAMPLE 2

New-LocalGroup -Name "mygroup" -GroupID 1001
Creates a new local group named "mygroup" with the group ID 1001

## PARAMETERS

### -GroupID

Optional.
Group ID

```yaml
Type: System.Int32
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Name

Name of the group to create

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
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

This function requires superuser privileges to create a group.
Ensure that you have the necessary permissions to run this command.
Use with caution, as it will permanently create a new group.
Be sure to back up any important data before proceeding.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalGroup.md)
