---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalGroup.md
schema: 2.0.0
---

# New-LocalGroup

## SYNOPSIS
Create a new local group

## SYNTAX

```
New-LocalGroup [-Name] <String> [-GroupID] <Int32> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new local security group

## EXAMPLES

### EXAMPLE 1
```
New-LocalGroup -Name "mygroup"
Creates a new local group named "mygroup"
```

### EXAMPLE 2
```
New-LocalGroup -Name "mygroup" -GroupID 1001
Creates a new local group named "mygroup" with the group ID 1001
```

## PARAMETERS

### -Name
Name of the group to create

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

### -GroupID
Optional.
Group ID

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
This function requires superuser privileges to create a group.
Ensure that you have the necessary permissions to run this command.
Use with caution, as it will permanently create a new group.
Be sure to back up any important data before proceeding.

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalGroup.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalGroup.md)

