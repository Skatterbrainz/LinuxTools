---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-UbuntuAdjustments.md
schema: 2.0.0
---

# Invoke-LogAssessment

## SYNOPSIS
Submit a log file for analysis

## SYNTAX

```
Invoke-LogAssessment [-Path] <String> [[-Instructions] <String>] [[-Question] <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Submit a log file for analysis to the PSAI assistant.
The assistant will provide a response based on the instructions and prompt provided.

## EXAMPLES

### EXAMPLE 1
```
Invoke-LogAssessment -Path "/var/log/syslog"
Returns the response from the assistant based on the log file analysis using the default instructions and prompt.
```

### EXAMPLE 2
```
Invoke-LogAssessment -Path "~/.xsession_errors" -Instructions "check the logs - output markdown table" -Question "the cinnamon desktop crashed a few hours ago. show 5 key error messages, look at the first 100"
Returns the response from the assistant based on the log file analysis using the specified instructions and prompt.
```

## PARAMETERS

### -Path
The path to the log file to be analyzed.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Instructions
Instructions to be provided to the assistant.
Default is "check the logs - output json".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Check the logs - output json
Accept pipeline input: False
Accept wildcard characters: False
```

### -Question
The question to be provided to the assistant.
Default is "show 5 key error messages, look at the first 100".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Show 5 key error messages, look at the first 100
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

### STRING - The response from the assistant based on the log file analysis.
## NOTES

## RELATED LINKS
