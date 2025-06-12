---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalUser.md
schema: 2.0.0
---

# Remove-LocalUser

## SYNOPSIS
Remove a local user account

## SYNTAX

```
Remove-LocalUser [-Name] <String> [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Remove a local user account

## EXAMPLES

### EXAMPLE 1
```
Remove-LocalUser -Name AdamMcchesney -WhatIf
This example shows what would happen if the user "AdamMcchesney" were to be removed without actually executing the command.
```

### EXAMPLE 2
```
Remove-LocalUser -Name AdamMcchesney
```

### EXAMPLE 3
```
Remove-LocalUser -Name AdamMcchesne
```

## PARAMETERS

### -Name
Name of the user to remove

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
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
This function requires superuser privileges to remove a user account.
Ensure that you have the necessary permissions to run this command.
Use with caution, as it will permanently delete the user and their home directory if specified.
Be sure to back up any important data before proceeding.

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalUser.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalUser.md)

