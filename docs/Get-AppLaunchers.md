---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AppLaunchers.md
schema: 2.0.0
---

# Get-AppLaunchers

## SYNOPSIS
Get the application launchers on the system.

## SYNTAX

```
Get-AppLaunchers [[-Scope] <String>] [[-Name] <String>] [-Contents] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
This function gets the application launchers on the system.

## EXAMPLES

### EXAMPLE 1
```
Get-AppLaunchers
```

Get all application launchers on the system for the current user.

### EXAMPLE 2
```
Get-AppLaunchers -Scope System
```

Get all application launchers on the system for all users.

### EXAMPLE 3
```
Get-AppLaunchers -Name Firefox
```

Get the application launcher for Firefox for the current user.

### EXAMPLE 4
```
Get-AppLaunchers -Name Firefox -Contents
```

Get the contents of the application launcher for Firefox for the current user.

## PARAMETERS

### -Scope
The scope of the application launchers to get.
The default is "User".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: User
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the application launcher to get.
If not specified, all application launchers are returned.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Contents
If Name is provided, this returns the contents of the matching application launchers.

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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AppLaunchers.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AppLaunchers.md)

