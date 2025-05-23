---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-IRQ.md
schema: 2.0.0
---

# Get-IRQ

## SYNOPSIS
Get IRQ interrupts

## SYNTAX

```
Get-IRQ [[-Id] <Object>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get IRQ interrupts and basic configuration settings

## EXAMPLES

### EXAMPLE 1
```
Get-IRQ
```

Returns current IRQ information

### EXAMPLE 2
```
Get-IRQ -Id 1
```

Returns only the IRQ with ID 1

## PARAMETERS

### -Id
Interrupt ID to search for.
If not specified, all interrupts are returned.

```yaml
Type: Object
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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-IRQ.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-IRQ.md)

