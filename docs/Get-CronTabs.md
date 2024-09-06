---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CronTabs.md
schema: 2.0.0
---

# Get-CronTabs

## SYNOPSIS
Get the list of cron jobs.
If a file is specified, it will return the contents of that file.

## SYNTAX

```
Get-CronTabs [[-CronTabFile] <String>] [[-Path] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
This function reads the contents of a cron file and returns the list of cron jobs.

## EXAMPLES

### EXAMPLE 1
```
Get-CronTabs -CronTabFile "mycronjob"
Returns the list of cron jobs in the file /etc/cron.d/mycronjob.
```

### EXAMPLE 2
```
Get-CronTabs
Returns the list of cron files in /etc/cron.d.
```

## PARAMETERS

### -CronTabFile
The name of the cron file to read.
If not provided, it will list all cron files in /etc/cron.d.

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

### -Path
The path to the cron files.
Default is /etc/cron.d.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: /etc/cron.d
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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CronTabs.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CronTabs.md)

