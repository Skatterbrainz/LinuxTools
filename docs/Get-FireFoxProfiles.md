---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-FireFoxProfiles.md
schema: 2.0.0
---

# Get-FireFoxProfiles

## SYNOPSIS
Get Firefox profiles from profiles.ini file.

## SYNTAX

```
Get-FireFoxProfiles [-DefaultProfile] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get Firefox profiles from profiles.ini file.
The function reads the profiles.ini file.
Then it filters out the non-profile keys and expands the path to full name.

## EXAMPLES

### EXAMPLE 1
```
Get-FireFoxProfiles
```

Get all Firefox profiles.

### EXAMPLE 2
```
Get-FireFoxProfiles -DefaultProfile
```

Get the default Firefox profile.

## PARAMETERS

### -DefaultProfile
Indicates to return the default profile.

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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-FireFoxProfiles.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-FireFoxProfiles.md)

