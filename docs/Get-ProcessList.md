---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ProcessList.md
schema: 2.0.0
---

# Get-ProcessList

## SYNOPSIS
Get-ProcessList retrieves a list of processes

## SYNTAX

```
Get-ProcessList [[-Top] <Int32>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get-ProcessList retrieves a list of processes and sorts them by CPU usage in descending order

## EXAMPLES

### EXAMPLE 1
```
Get-ProcessList
Get-ProcessList retrieves a list of processes and sorts them by CPU usage in descending order
```

### EXAMPLE 2
```
Get-ProcessList -Top 5
Get-ProcessList retrieves a list of the top 5 processes sorted by CPU usage in descending order
```

## PARAMETERS

### -Top
Top number of processes to display.
Default is 10

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 10
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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ProcessList.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ProcessList.md)

