---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalUser.md
schema: 2.0.0
---

# New-ToastNotification

## SYNOPSIS
Displays a desktop notification message using notify-send

## SYNTAX

```
New-ToastNotification [-Message] <String> [[-Title] <String>] [[-Urgency] <String>] [[-IconName] <String>]
 [-Wait] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Displays a desktop notification message using notify-send with optional parameters

## EXAMPLES

### EXAMPLE 1
```
New-ToastNotification -Message "Hello World!"
Displays a notification with the message "Hello World!"
```

### EXAMPLE 2
```
New-ToastNotification -Message "Hello World!" -Title "Greetings"
Displays a notification with the message "Hello World!" and the title "Greetings"
```

### EXAMPLE 3
```
New-ToastNotification -Message "Hello World!" -Urgency critical
Displays a critical notification with the message "Hello World!"
```

### EXAMPLE 4
```
New-ToastNotification -Message "Hello World!" -Icon dialog-warning.png
Displays a notification with the message "Hello World!" and the icon dialog-warning.png
```

## PARAMETERS

### -Message
The message to display in the notification.
This can include the following HTML tags for formatting:
\<b\>\</b\> - bold
\<i\>\</i\> - italic
\<u\>\</u\> - underline
\<a href="..."\>\</a\>  - hyperlink
\<img src="..." alt="..."/\> - image

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

### -Title
The title of the notification.
Default is "Notification"

```yaml
Type: String
Parameter Sets: (All)
Aliases: Summary

Required: False
Position: 2
Default value: Notification
Accept pipeline input: False
Accept wildcard characters: False
```

### -Urgency
The urgency level of the notification (low, normal, critical).
Default is normal

```yaml
Type: String
Parameter Sets: (All)
Aliases: Category

Required: False
Position: 3
Default value: Normal
Accept pipeline input: False
Accept wildcard characters: False
```

### -IconName
The icon to display in the notification.
Default is dialog-information.png
Filenames are found in /usr/share/icons/gnome/48x48/status/
if the specified icon is not found, no icon will be displayed

```yaml
Type: String
Parameter Sets: (All)
Aliases: Icon

Required: False
Position: 4
Default value: Dialog-information.png
Accept pipeline input: False
Accept wildcard characters: False
```

### -Wait
Wait for the notification to be closed before continuing.
Default is notification closes after a brief delay

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
#notify-send "\<b\>Hello World!\</b\>This is a message from PowerShell" -u critical -i /usr/share/icons/gnome/48x48/status/dialog-warning.png

## RELATED LINKS
