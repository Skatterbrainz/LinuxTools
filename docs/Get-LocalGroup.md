---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LocalGroup.md
schema: 2.0.0
---

# Get-LocalGroup

## SYNOPSIS
Get local groups

## SYNTAX

```
Get-LocalGroup [[-Identity] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get local security groups

## EXAMPLES

### EXAMPLE 1
```
Get-LocalGroup
```

Returns a list of all local groups on the system in tabular format.

### EXAMPLE 2
```
Get-LocalGroup -Identity "lpadmin"
```

Returns details for the "lpadmin" group on the local system in tabular format.

Name    ID  Members  Computer
----    --  -------  --------
lpadmin 105 {user42} mint22

## PARAMETERS

### -Identity
Optional.
Name of group to return.
Default is to return all groups.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LocalGroup.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LocalGroup.md)

