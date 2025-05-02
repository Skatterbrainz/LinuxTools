---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DnfPackages.md
schema: 2.0.0
---

# Get-DnfPackages

## SYNOPSIS
Get DNF packages

## SYNTAX

```
Get-DnfPackages [[-Name] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get DNF packages and basic configuration settings

## EXAMPLES

### EXAMPLE 1
```
Get-DnfPackages
Returns all DNF packages
```

### EXAMPLE 2
```
Get-DnfPackages -Name "vim"
Returns only the vim package
```

## PARAMETERS

### -Name
Package name to search for.
If not specified, all packages are returned.

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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DnfPackages.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DnfPackages.md)

