---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AuthLog.md
schema: 2.0.0
---

# Get-AuthLog

## SYNOPSIS
Parses the authentication log file and returns structured data.

## SYNTAX

```
Get-AuthLog [[-Path] <String>] [[-Filter] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Parses the authentication log file located at /var/log/auth.log (or a specified path) and returns structured data.
You can filter the log entries by providing a filter string.

## EXAMPLES

### EXAMPLE 1
```
Get-AuthLog -Path "/var/log/auth.log" -Filter "pam_unix"
This example retrieves all log entries from the authentication log that contain the string "pam_unix".
```

### EXAMPLE 2
```
Get-AuthLog
This example retrieves all log entries from the default authentication log file "/var/log/auth.log".
```

## PARAMETERS

### -Path
The path to the authentication log file.
Default is "/var/log/auth.log".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: /var/log/auth.log
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter
A filter string to match against the log entries.
Only entries that match this filter will be returned.

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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AuthLog.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AuthLog.md)

