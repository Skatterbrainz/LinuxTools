---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Start-FireFoxProfile.md
schema: 2.0.0
---

# Start-FireFoxProfile

## SYNOPSIS
Starts a Firefox profile.

## SYNTAX

```
Start-FireFoxProfile [[-ProfileName] <String>] [-DefaultProfile] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Starts a Firefox profile.
If a profile name is not provided, the function will prompt for one.

## EXAMPLES

### EXAMPLE 1
```
Start-FireFoxProfile
```

Prompts user to select a profile from a list, and starts Firefox with the selected profile.

### EXAMPLE 2
```
Start-FireFoxProfile -ProfileName "Contoso"
```

Starts Firefox with the profile named "Contoso".

### EXAMPLE 3
```
Start-FireFoxProfile -DefaultProfile
```

Starts Firefox with the default profile.

## PARAMETERS

### -ProfileName
The name of the profile to start.
If not provided, the function will prompt for one, unless
the -DefaultProfile switch is used.

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

### -DefaultProfile
Indicates to start the default profile.

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
To view, manage or create Firefox profiles, use the "about:profiles" URL in Firefox.

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Start-FireFoxProfile.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Start-FireFoxProfile.md)

