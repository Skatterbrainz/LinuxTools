---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LocalGroupMember.md
schema: 2.0.0
---

# Get-LocalGroupMember

## SYNOPSIS
Get local group members

## SYNTAX

```
Get-LocalGroupMember [-Name] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get local security group members

## EXAMPLES

### EXAMPLE 1
```
Get-LocalGroupMember -Name "lpadmin"
Returns a list of members in the "lpadmin" group on the local system.
```

## PARAMETERS

### -Name
Name of the group to return members for

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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LocalGroupMember.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LocalGroupMember.md)

