---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Add-LocalGroupMember.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Add-LocalGroupMember
---

# Add-LocalGroupMember

## SYNOPSIS

Add a user to a local group

## SYNTAX

### __AllParameterSets

```
Add-LocalGroupMember [-Name] <string> [-Member] <string> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Add a user to a local security group

## EXAMPLES

### EXAMPLE 1

Add-LocalGroupMember -Name "lpadmin" -Member "user42"

## PARAMETERS

### -Member

Name of the user to add to the group.

```yaml
Type: System.String
DefaultValue: ''
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

Name of the group to add the user to.

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

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Add-LocalGroupMember.md)
