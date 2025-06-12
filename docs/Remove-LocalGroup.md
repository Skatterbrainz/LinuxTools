---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalGroup.md
schema: 2.0.0
---

# Remove-LocalGroup

## SYNOPSIS
Remove a local security group

## SYNTAX

```
Remove-LocalGroup [-Name] <String> [-Force] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Remove a local security group

## EXAMPLES

### EXAMPLE 1
```
Remove-LocalGroup -Name "mygroup"
Removes the local security group named "mygroup"
```

### EXAMPLE 2
```
Remove-LocalGroup -Name "mygroup" -Force
Removes the local security group named "mygroup" even if users have it as their primary group
```

### EXAMPLE 3
```
Remove-LocalGroup -Name "mygroup" -WhatIf
This example shows what would happen if the group "mygroup" were to be removed without actually executing the command.
```

## PARAMETERS

### -Name
Name of the group to remove

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

### -Force
Forces the removal of the group even if users have it as their primary group.

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
This function requires superuser privileges to remove a group.
Ensure that you have the necessary permissions to run this command.
Use with caution, as it will permanently delete the group and its members.
Be sure to back up any important data before proceeding.

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalGroup.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalGroup.md)

