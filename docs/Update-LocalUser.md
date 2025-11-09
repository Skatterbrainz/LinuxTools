---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LocalUser.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Update-LocalUser
---

# Update-LocalUser

## SYNOPSIS

Update a local user account

## SYNTAX

### __AllParameterSets

```
Update-LocalUser [-Name] <string> [[-NewPassword] <securestring>] [[-Comment] <string>]
 [[-HomeDirectory] <string>] [[-ShellPath] <string>] [[-GroupID] <int>] [[-AccountExpires] <string>]
 [[-UID] <int>] [-Lock] [-Unlock] [-MoveHome] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Update a local user account with new settings

## EXAMPLES

### EXAMPLE 1

Update-LocalUser -Name "Fu Barr" -Comment "The Fubar of Tarfu"
Updates the user account named "Fu Barr" with the comment "The Fubar of Tarfu"

### EXAMPLE 2

Update-LocalUser -Name "Fu Barr" -HomeDirectory "/home/fubar" -MoveHome
Updates the user account named "Fu Barr" with the home directory "/home/fubar" and moves the home directory

### EXAMPLE 3

Update-LocalUser -Name "Fu Barr" -ShellPath "/bin/zsh"
Updates the user account named "Fu Barr" with the shell path "/bin/zsh"

### EXAMPLE 4

Update-LocalUser -Name "Fu Barr" -GroupID 1001
Updates the user account named "Fu Barr" with the group ID 1001

### EXAMPLE 5

Update-LocalUser -Name "Fu Barr" -AccountExpires "5/1/2025"
Updates the user account named "Fu Barr" with the account expiration date of May 1, 2025

### EXAMPLE 6

Update-LocalUser -Name "Fu Barr" -NewPassword (ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force)
Updates the user account named "Fu Barr" with the new password "P@ssw0rd"

### EXAMPLE 7

Update-LocalUser -Name "Fu Barr" -Lock
Locks the user account named "Fu Barr"

### EXAMPLE 8

Update-LocalUser -Name "Fu Barr" -Unlock
Unlocks the user account named "Fu Barr"

## PARAMETERS

### -AccountExpires

Optional.
Date when the account expires.
Use 'MM/dd/yyyy' format.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 6
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Comment

Optional.
Comment to assign to the user account.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -GroupID

Optional.
New group ID for the user.

```yaml
Type: System.Int32
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 5
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -HomeDirectory

Optional.
New home directory for the user.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 3
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Lock

Optional.
Lock the user account.
Ignores -NewPassword

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

### -MoveHome

Optional.
Move the home directory to the new location.

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

Name of the user to update

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

### -NewPassword

Optional.
New password for the user.
Must be a secure string.
This parameter is ignored if -Lock or -Unlock is used.

```yaml
Type: System.Security.SecureString
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

### -ShellPath

Optional.
New shell path for the user.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 4
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -UID

Optional.
New user ID

```yaml
Type: System.Int32
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 7
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Unlock

Optional.
Unlock the user account.
Ignores -NewPassword

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

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LocalUser.md)
