---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalGroupMember.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Remove-LocalGroupMember
---

# Remove-LocalGroupMember

## SYNOPSIS

Remove a user from a local group

## SYNTAX

### __AllParameterSets

```
Remove-LocalGroupMember [-Name] <string> [-Member] <string> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Remove a user from a local security group

## EXAMPLES

### EXAMPLE 1

Remove-LocalGroupMember -Name "lpadmin" -Member "user42"
Removes the user "user42" from the "lpadmin" group.

## PARAMETERS

### -Member

Name of the user to remove from the group.

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

Name of the group to remove the user from.

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

This function requires superuser privileges to modify group memberships.
Ensure that you have the necessary permissions to run this command.
Use with caution, as it will permanently remove the user from the specified group.
Be sure to back up any important data before proceeding.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalGroupMember.md)
