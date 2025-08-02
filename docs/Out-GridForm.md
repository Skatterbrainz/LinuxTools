---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Out-GridForm.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: Out-GridForm
---

# Out-GridForm

## SYNOPSIS

Generates a YAD grid form dialog from a collection of objects.

## SYNTAX

### __AllParameterSets

```
Out-GridForm [-Data] <psobject[]> [[-Title] <string>] [[-Text] <string>] [[-Width] <int>]
 [[-Height] <int>] [[-Separator] <string>] [[-FontName] <string>] [[-IconPath] <string>]
 [[-ImagePath] <string>] [[-ButtonsLayout] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Creates a YAD grid form dialog that allows users to select items from a list of objects.

## EXAMPLES

### EXAMPLE 1

$files = Get-ChildItem -Path "C:\MyFiles" | Select-Object Name, Length, LastWriteTime
$selected = $files | Out-GridForm -Title "File List" -Text "Select files to process" -Width 800 -Height 600

This example creates a YAD grid form dialog displaying a list of files in a specified directory, allowing the user to select one or more files for further processing.

### EXAMPLE 2

$data = @(
	[pscustomobject]@{ ID = 1; Name = "Alice"; Email = "alice@contoso.com" }
	[pscustomobject]@{ ID = 2; Name = "Bob"; Email = "bob@contoso.com" }
)
$selected = $data | Out-GridForm -Title "User Table" -Text "Select users" -Width 600 -Height 400

This example creates a YAD grid form dialog displaying a table of users with their IDs, names, and emails.
The user can select one or more users from the list.

## PARAMETERS

### -ButtonsLayout

The layout of the buttons in the YAD dialog.
Defaults to 'center'.
Valid values are 'center', 'edge', 'end', 'spread', and 'start'.

```yaml
Type: System.String
DefaultValue: center
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 9
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Data

A collection of objects to display in the grid.
Each object should have properties that will be used as columns in the grid.

```yaml
Type: System.Management.Automation.PSObject[]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -FontName

The font name to use in the YAD dialog.
If not specified, the default system font will be used.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 6
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Height

The height of the YAD dialog window in pixels.
Defaults to 400.

```yaml
Type: System.Int32
DefaultValue: 400
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

### -IconPath

The path to the icon to display in the YAD dialog.
Defaults to 'dialog-information'.

```yaml
Type: System.String
DefaultValue: dialog-information
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 7
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ImagePath

The path to the image to display in the YAD dialog.
Defaults to 'dialog-question'.

```yaml
Type: System.String
DefaultValue: dialog-question
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 8
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Separator

The separator used to join multiple selections when the dialog allows multiple selections.
Defaults to "|".

```yaml
Type: System.String
DefaultValue: '|'
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

### -Text

The text to display in the YAD dialog, prompting the user to make a selection.
Defaults to "Select items".

```yaml
Type: System.String
DefaultValue: Select items
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

### -Title

The title of the YAD dialog window.
Defaults to "Grid Form".

```yaml
Type: System.String
DefaultValue: Grid Form
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

### -Width

The width of the YAD dialog window in pixels.
Defaults to 600.

```yaml
Type: System.Int32
DefaultValue: 600
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Management.Automation.PSObject[]

{{ Fill in the Description }}

## OUTPUTS

## NOTES

This function requires YAD (Yet Another Dialog) to be installed on the system.
It is typically used in Linux environments where YAD is available.
To play with this directly, type 'yad --help' in a terminal.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Out-GridForm.md)
