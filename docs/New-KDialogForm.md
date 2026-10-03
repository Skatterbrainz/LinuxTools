---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-KDialogForm.md
Locale: en-US
Module Name: linuxtools
ms.date: 10/03/2026
PlatyPS schema version: 2024-05-01
title: New-KDialogForm
---

# New-KDialogForm

## SYNOPSIS

Creates and displays a KDE `kdialog` form of the requested type.

## SYNTAX

### __AllParameterSets

```powershell
New-KDialogForm [[-Title] <string>] [[-Message] <string>] [[-FormType] <string>]
 [[-InputValues] <Object>] [[-DefaultValues] <Object>] [<CommonParameters>]
```

## DESCRIPTION

Builds and runs a `kdialog` command for common input and selection dialogs.
For list-based dialogs, values are mapped to numeric IDs and returned as selected value text.

Supported `FormType` values:
- `password`
- `msgbox`
- `inputbox`
- `combobox`
- `checklist`
- `radiolist`
- `selectfile`
- `savefile`
- `selectfolder`
- `openfile`
- `error`
- `menu`

## EXAMPLES

### EXAMPLE 1

```powershell
New-KDialogForm -Message "Enter password:" -FormType password
```

### EXAMPLE 2

```powershell
New-KDialogForm -Message "Choose items" -FormType checklist -InputValues @("Alpha","Bravo","Charlie")
```

### EXAMPLE 3

```powershell
New-KDialogForm -Message "Choose defaults" -FormType checklist -InputValues @("Alpha","Bravo","Charlie") -DefaultValues @("Bravo","Charlie")
```

## PARAMETERS

### -Title

Dialog title placeholder value (currently retained for compatibility).

```yaml
Type: System.String
DefaultValue: KDialog Form
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Message

Dialog prompt/message.

```yaml
Type: System.String
DefaultValue: Message
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

### -FormType

Dialog type to create.

```yaml
Type: System.String
DefaultValue: msgbox
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
AcceptedValues: [password, msgbox, inputbox, combobox, checklist, radiolist, selectfile, savefile, selectfolder, openfile, error, menu]
HelpMessage: ''
```

### -InputValues

Input list used by list-driven form types (`combobox`, `checklist`, `radiolist`, `menu`).

```yaml
Type: System.Object
DefaultValue: ''
SupportsWildcards: false
Aliases: []
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

### -DefaultValues

Default selected values for list-based forms.
For `inputbox`, the first item is used as the default input text.

```yaml
Type: System.Object
DefaultValue: ''
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

Depends on `FormType` and selection mode (string, secure string, or selected values).

## NOTES

Requires `kdialog` to be installed and available in `PATH`.

## RELATED LINKS

- [New-KDialogForm source](https://github.com/Skatterbrainz/linuxtools/blob/master/public/New-KDialogForm.ps1)
