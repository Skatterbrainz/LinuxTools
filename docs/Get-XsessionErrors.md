---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-UbuntuAdjustments.md
schema: 2.0.0
---

# Get-XsessionErrors

## SYNOPSIS
Get the contents of the ~/.xsession-errors file

## SYNTAX

```
Get-XsessionErrors [[-logPath] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the contents of the ~/.xsession-errors file, which is a common location for error messages in Linux desktop environments.

## EXAMPLES

### EXAMPLE 1
```
Get-XsessionErrors
Returns the contents of the ~/.xsession-errors file.
```

## PARAMETERS

### -logPath
The path to the log file to be read.
Default is "~/.xsession-errors".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: ~/.xsession-errors
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
