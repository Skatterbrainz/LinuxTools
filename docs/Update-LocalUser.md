---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LocalUser.md
schema: 2.0.0
---

# Update-LocalUser

## SYNOPSIS
Update a local user account

## SYNTAX

```
Update-LocalUser [-Name] <String> [[-NewPassword] <SecureString>] [-Lock] [-Unlock] [[-Comment] <String>]
 [[-HomeDirectory] <String>] [-MoveHome] [[-ShellPath] <String>] [[-GroupID] <Int32>]
 [[-AccountExpires] <String>] [[-UID] <Int32>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update a local user account with new settings

## EXAMPLES

### EXAMPLE 1
```
Update-LocalUser -Name "Fu Barr" -Comment "The Fubar of Tarfu"
Updates the user account named "Fu Barr" with the comment "The Fubar of Tarfu"
```

### EXAMPLE 2
```
Update-LocalUser -Name "Fu Barr" -HomeDirectory "/home/fubar" -MoveHome
Updates the user account named "Fu Barr" with the home directory "/home/fubar" and moves the home directory
```

### EXAMPLE 3
```
Update-LocalUser -Name "Fu Barr" -ShellPath "/bin/zsh"
Updates the user account named "Fu Barr" with the shell path "/bin/zsh"
```

### EXAMPLE 4
```
Update-LocalUser -Name "Fu Barr" -GroupID 1001
Updates the user account named "Fu Barr" with the group ID 1001
```

### EXAMPLE 5
```
Update-LocalUser -Name "Fu Barr" -AccountExpires "5/1/2025"
Updates the user account named "Fu Barr" with the account expiration date of May 1, 2025
```

### EXAMPLE 6
```
Update-LocalUser -Name "Fu Barr" -NewPassword (ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force)
Updates the user account named "Fu Barr" with the new password "P@ssw0rd"
```

### EXAMPLE 7
```
Update-LocalUser -Name "Fu Barr" -Lock
Locks the user account named "Fu Barr"
```

### EXAMPLE 8
```
Update-LocalUser -Name "Fu Barr" -Unlock
Unlocks the user account named "Fu Barr"
```

## PARAMETERS

### -Name
Name of the user to update

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

### -NewPassword
Optional.
New password for the user.
Must be a secure string.
This parameter is ignored if -Lock or -Unlock is used.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Lock
Optional.
Lock the user account.
Ignores -NewPassword

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

### -Unlock
Optional.
Unlock the user account.
Ignores -NewPassword

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

### -Comment
Optional.
Comment to assign to the user account.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HomeDirectory
Optional.
New home directory for the user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MoveHome
Optional.
Move the home directory to the new location.

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

### -ShellPath
Optional.
New shell path for the user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupID
Optional.
New group ID for the user.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -AccountExpires
Optional.
Date when the account expires.
Use 'MM/dd/yyyy' format.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UID
Optional.
New user ID

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: 0
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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LocalUser.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LocalUser.md)

