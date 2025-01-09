---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalUser.md
schema: 2.0.0
---

# New-LocalUser

## SYNOPSIS
Create a new local user account

## SYNTAX

```
New-LocalUser [-Name] <String> [[-UID] <Int32>] [-Comment] <String> [[-Password] <SecureString>]
 [[-HomeDirectory] <String>] [[-ShellPath] <String>] [[-GroupID] <Int32>] [[-AccountExpires] <String>]
 [-NoHomeDirectory] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new local user account

## EXAMPLES

### EXAMPLE 1
```
New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu"
Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu"
```

### EXAMPLE 2
```
New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -AccountExpires "5/1/2025"
Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu" and expires on May 1, 2025
```

### EXAMPLE 3
```
New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -Password (ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force)
Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu" and sets the password to "P@ssw0rd"
```

### EXAMPLE 4
```
New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -HomeDirectory "/home/fubar" -ShellPath "/bin/zsh"
Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu", home directory "/home/fubar", and shell path "/bin/zsh"
```

### EXAMPLE 5
```
New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -NoHomeDirectory
Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu" and does not create a home directory
```

## PARAMETERS

### -Name
Name of the user to create

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UID
Optional.
User ID

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Comment
Comment to assign to the new user account

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Optional.
Password for the user.
Must be a secure string.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HomeDirectory
Optional.
Home directory for the user.
Default is "/home/$Name"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: "/home/$Name"
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShellPath
Optional.
Path to the user's shell.
Default is "/bin/bash"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: /bin/bash
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupID
Optional.
Group ID

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -AccountExpires
Optional.
Date when the account expires

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoHomeDirectory
Optional.
Do not create a home directory

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalUser.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalUser.md)

