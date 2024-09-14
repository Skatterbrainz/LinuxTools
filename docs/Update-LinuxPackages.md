---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LinuxPackages.md
schema: 2.0.0
---

# Update-LinuxPackages

## SYNOPSIS
Update and upgrade Linux packages

## SYNTAX

```
Update-LinuxPackages [[-Type] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update and upgrade Linux packages

## EXAMPLES

### EXAMPLE 1
```
Update-LinuxPackages
```

Updates all packages

### EXAMPLE 2
```
Update-LinuxPackages -Type "apt"
```

Updates only apt packages

## PARAMETERS

### -Type
Valid values are "apt", "snap", "flatpak", or "all".
Default is "all".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: All
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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LinuxPackages.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LinuxPackages.md)

