---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LocalGroup.md
schema: 2.0.0
---

# Update-LocalGroup

## SYNOPSIS
Update a local group

## SYNTAX

```
Update-LocalGroup [-Name] <String> [[-NewName] <String>] [[-GroupID] <Int32>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update a local security group with new settings

## EXAMPLES

### EXAMPLE 1
```
Update-LocalGroup -Name "mygroup" -NewName "mynewgroup"
Updates the local group named "mygroup" with the new name "mynewgroup"
```

### EXAMPLE 2
```
Update-LocalGroup -Name "mygroup" -GroupID 1001
Updates the local group named "mygroup" with the group ID 1001
```

## PARAMETERS

### -Name
Name of the group to update

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

### -NewName
Optional.
New name for the group

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupID
Optional.
New group ID

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LocalGroup.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LocalGroup.md)

