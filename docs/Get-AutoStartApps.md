---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AutoStartApps.md
schema: 2.0.0
---

# Get-AutoStartApps

## SYNOPSIS
Get a list of applications set to auto-start on login

## SYNTAX

```
Get-AutoStartApps [[-Name] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get a list of applications set to auto-start on login

## EXAMPLES

### EXAMPLE 1
```
Get-AutoStartApps
Returns a list of applications set to auto-start on login
```

### EXAMPLE 2
```
Get-AutoStartApps -Name "firefox.desktop"
Returns the desktop file for the specified application
```

## PARAMETERS

### -Name
{{ Fill Name Description }}

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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AutoStartApps.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AutoStartApps.md)

