---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalGroupMember.md
schema: 2.0.0
---

# Remove-LocalGroupMember

## SYNOPSIS
Remove a user from a local group

## SYNTAX

```
Remove-LocalGroupMember [-Name] <String> [-Member] <String> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Remove a user from a local security group

## EXAMPLES

### EXAMPLE 1
```
Remove-LocalGroupMember -Name "lpadmin" -Member "user42"
```

## PARAMETERS

### -Name
Name of the group to remove the user from.

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

### -Member
Name of the user to remove from the group.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalGroupMember.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalGroupMember.md)

