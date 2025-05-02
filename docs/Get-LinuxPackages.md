---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxPackages.md
schema: 2.0.0
---

# Get-LinuxPackages

## SYNOPSIS
Get Linux packages

## SYNTAX

```
Get-LinuxPackages [[-Type] <String>] [-Upgradable] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get Linux packages and basic configuration settings

## EXAMPLES

### EXAMPLE 1
```
Get-LinuxPackages
```

Returns all packages.
Same as Get-LinuxPackages -Type "all"

### EXAMPLE 2
```
Get-LinuxPackages -Type "flatpak"
```

Returns only flatpak packages

### EXAMPLE 3
```
Get-LinuxPackages -Type "apt" -Upgradable
```

Returns only upgradable apt packages

### EXAMPLE 4
```
Get-LinuxPackages -Type "snap"
```

Returns only snap packages

### EXAMPLE 5
```
Get-LinuxPackages -Type "dnf"
```

Returns only dnf packages

## PARAMETERS

### -Type
Valid values are "apt", "snap", "flatpak", "dnf" or "all".
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

### -Upgradable
Only valid for "apt" type.
If present, returns only upgradable packages.

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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxPackages.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxPackages.md)

