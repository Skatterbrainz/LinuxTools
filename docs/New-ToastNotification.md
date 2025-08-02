---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-ToastNotification.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: New-ToastNotification
---

# New-ToastNotification

## SYNOPSIS

Displays a desktop notification message using notify-send

## SYNTAX

### __AllParameterSets

```
New-ToastNotification [-Message] <string> [[-Title] <string>] [[-Urgency] <string>]
 [[-IconName] <string>] [-Wait] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Displays a desktop notification message using notify-send with optional parameters

## EXAMPLES

### EXAMPLE 1

New-ToastNotification -Message "Hello World!"
Displays a notification with the message "Hello World!"

### EXAMPLE 2

New-ToastNotification -Message "Hello World!" -Title "Greetings"
Displays a notification with the message "Hello World!" and the title "Greetings"

### EXAMPLE 3

New-ToastNotification -Message "Hello World!" -Urgency critical
Displays a critical notification with the message "Hello World!"

### EXAMPLE 4

New-ToastNotification -Message "Hello World!" -Icon dialog-warning.png
Displays a notification with the message "Hello World!" and the icon dialog-warning.png

## PARAMETERS

### -IconName

The icon to display in the notification.
Default is dialog-information.png
Filenames are found in /usr/share/icons/gnome/48x48/status/
if the specified icon is not found, no icon will be displayed

```yaml
Type: System.String
DefaultValue: dialog-information.png
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

### -Message

The message to display in the notification.
This can include the following HTML tags for formatting:
<b></b> - bold
<i></i> - italic
<u></u> - underline
<a href="..."></a>  - hyperlink
<img src="..." alt="..."/> - image

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

The title of the notification.
Default is "Notification"

```yaml
Type: System.String
DefaultValue: Notification
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

The urgency level of the notification (low, normal, critical).
Default is normal

```yaml
Type: System.String
DefaultValue: normal
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
AcceptedValues: []
HelpMessage: ''
```

### -Wait

Wait for the notification to be closed before continuing.
Default is notification closes after a brief delay

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

#notify-send "<b>Hello World!</b>This is a message from PowerShell" -u critical -i /usr/share/icons/gnome/48x48/status/dialog-warning.png


## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-ToastNotification.md)
