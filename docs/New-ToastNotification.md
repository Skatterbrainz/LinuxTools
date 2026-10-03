---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-ToastNotification.md
Locale: en-US
Module Name: linuxtools
ms.date: 10/03/2026
PlatyPS schema version: 2024-05-01
title: New-ToastNotification
---

# New-ToastNotification

## SYNOPSIS

Displays a desktop notification message using `notify-send`.

## SYNTAX

### __AllParameterSets

```powershell
New-ToastNotification [-Message] <string> [[-Title] <string>] [[-Urgency] <string>]
 [[-IconName] <string>] [[-Timeout] <int>] [-Wait] [[-ActionName] <string>] [<CommonParameters>]
```

## DESCRIPTION

Builds and runs a `notify-send` command with optional urgency, icon, timeout, wait behavior,
and optional action button text.

## EXAMPLES

### EXAMPLE 1

```powershell
New-ToastNotification -Message "Hello World!"
```

### EXAMPLE 2

```powershell
New-ToastNotification -Message "Update complete" -Title "LinuxTools" -Urgency Low
```

### EXAMPLE 3

```powershell
New-ToastNotification -Message "Review required" -Urgency Critical -Wait -ActionName "Open"
```

## PARAMETERS

### -Message

Notification body text. Supports markup accepted by your notification daemon.

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

### -Title

Notification title.

```yaml
Type: System.String
DefaultValue: LinuxTools Message
SupportsWildcards: false
Aliases:
- Summary
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

### -Urgency

Notification urgency level. Valid values: `Low`, `Normal`, `Critical`.

```yaml
Type: System.String
DefaultValue: Normal
SupportsWildcards: false
Aliases:
- Category
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: [Low, Normal, Critical]
HelpMessage: ''
```

### -IconName

Optional icon name or path.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases:
- Icon
ParameterSets:
- Name: (All)
  Position: 3
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Timeout

Milliseconds before notification auto-dismiss (daemon dependent).

```yaml
Type: System.Int32
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 4
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Wait

Wait for the notification to close.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ActionName

Optional action button name.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 5
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

## RELATED LINKS

- [New-ToastNotification source](https://github.com/Skatterbrainz/linuxtools/blob/master/public/New-ToastNotification.ps1)
