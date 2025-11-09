---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Invoke-LogAssessment.md
Locale: en-US
Module Name: linuxtools
ms.date: 11/09/2025
PlatyPS schema version: 2024-05-01
title: Invoke-LogAssessment
---

# Invoke-LogAssessment

## SYNOPSIS

Submit a log file for analysis

## SYNTAX

### __AllParameterSets

```
Invoke-LogAssessment [-Path] <string> [[-Instructions] <string>] [[-Question] <string>]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Submit a log file for analysis to the PSAI assistant.
The assistant will provide a response based on the instructions and prompt provided.

## EXAMPLES

### EXAMPLE 1

Invoke-LogAssessment -Path "/var/log/syslog"
Returns the response from the assistant based on the log file analysis using the default instructions and prompt.

### EXAMPLE 2

Invoke-LogAssessment -Path "~/.xsession_errors" -Instructions "check the logs - output markdown table" -Question "the cinnamon desktop crashed a few hours ago. show 5 key error messages, look at the first 100"
Returns the response from the assistant based on the log file analysis using the specified instructions and prompt.

## PARAMETERS

### -Instructions

Instructions to be provided to the assistant.
Default is "check the logs - output json".

```yaml
Type: System.String
DefaultValue: check the logs - output json
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Path

The path to the log file to be analyzed.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Question

The question to be provided to the assistant.
Default is "show 5 key error messages, look at the first 100".

```yaml
Type: System.String
DefaultValue: show 5 key error messages, look at the first 100
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### STRING - The response from the assistant based on the log file analysis.

{{ Fill in the Description }}

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Invoke-LogAssessment.md)
