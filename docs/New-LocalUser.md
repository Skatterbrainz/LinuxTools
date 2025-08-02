---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalUser.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: New-LocalUser
---

# New-LocalUser

## SYNOPSIS

Create a new local user account

## SYNTAX

### __AllParameterSets

```
New-LocalUser [-Name] <string> [[-UID] <int>] [-Comment] <string> [[-Password] <securestring>]
 [[-HomeDirectory] <string>] [[-ShellPath] <string>] [[-GroupID] <int>] [[-AccountExpires] <string>]
 [-NoHomeDirectory] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Create a new local user account

## EXAMPLES

### EXAMPLE 1

New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu"
Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu"

### EXAMPLE 2

New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -AccountExpires "5/1/2025"
Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu" and expires on May 1, 2025

### EXAMPLE 3

New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -Password (ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force)
Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu" and sets the password to "P@ssw0rd"

### EXAMPLE 4

New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -HomeDirectory "/home/fubar" -ShellPath "/bin/zsh"
Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu", home directory "/home/fubar", and shell path "/bin/zsh"

### EXAMPLE 5

New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -NoHomeDirectory
Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu" and does not create a home directory

## PARAMETERS

### -AccountExpires

Optional.
Date when the account expires

```yaml
Type: System.String
DefaultValue: ''
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

### -Comment

Comment to assign to the new user account

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

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
  Position: 6
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
Home directory for the user.
Default is "/home/$Name"

```yaml
Type: System.String
DefaultValue: '"/home/$Name"'
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

### -Name

Name of the user to create

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

### -NoHomeDirectory

Optional.
Do not create a home directory

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

### -Password

Optional.
Password for the user.
Must be a secure string.

```yaml
Type: System.Security.SecureString
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

### -ShellPath

Optional.
Path to the user's shell.
Default is "/bin/bash"

```yaml
Type: System.String
DefaultValue: /bin/bash
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

### -UID

Optional.
User ID

```yaml
Type: System.Int32
DefaultValue: 0
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

This function requires superuser privileges to create a user account.
Ensure that you have the necessary permissions to run this command.
Use with caution, as it will permanently create a new user account.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalUser.md)
