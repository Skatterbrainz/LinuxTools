---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxDistro.md
schema: 2.0.0
---

# Get-LinuxDistro

## SYNOPSIS
Get the Linux distribution name.

## SYNTAX

```
Get-LinuxDistro [[-distro] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function reads the /etc/os-release file to determine the Linux distribution name.

## EXAMPLES

### EXAMPLE 1
```
Get-LinuxDistro
Returns the Linux distribution name.
```

## PARAMETERS

### -distro
The Linux distribution name.
If not provided, the function will attempt to determine it.

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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxDistro.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxDistro.md)

