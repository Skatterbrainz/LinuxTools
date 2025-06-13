---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Out-GridForm.md
schema: 2.0.0
---

# Out-GridForm

## SYNOPSIS
Generates a YAD grid form dialog from a collection of objects.

## SYNTAX

```
Out-GridForm [-Data] <PSObject[]> [[-Title] <String>] [[-Text] <String>] [[-Width] <Int32>] [[-Height] <Int32>]
 [[-Separator] <String>] [[-FontName] <String>] [[-IconPath] <String>] [[-ImagePath] <String>]
 [[-ButtonsLayout] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Creates a YAD grid form dialog that allows users to select items from a list of objects.

## EXAMPLES

### EXAMPLE 1
```
$files = Get-ChildItem -Path "C:\MyFiles" | Select-Object Name, Length, LastWriteTime
$selected = $files | Out-GridForm -Title "File List" -Text "Select files to process" -Width 800 -Height 600
```

This example creates a YAD grid form dialog displaying a list of files in a specified directory, allowing the user to select one or more files for further processing.

### EXAMPLE 2
```
$data = @(
	[pscustomobject]@{ ID = 1; Name = "Alice"; Email = "alice@contoso.com" }
	[pscustomobject]@{ ID = 2; Name = "Bob"; Email = "bob@contoso.com" }
)
$selected = $data | Out-GridForm -Title "User Table" -Text "Select users" -Width 600 -Height 400
```

This example creates a YAD grid form dialog displaying a table of users with their IDs, names, and emails.
The user can select one or more users from the list.

## PARAMETERS

### -Data
A collection of objects to display in the grid.
Each object should have properties that will be used as columns in the grid.

```yaml
Type: PSObject[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Title
The title of the YAD dialog window.
Defaults to "Grid Form".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Grid Form
Accept pipeline input: False
Accept wildcard characters: False
```

### -Text
The text to display in the YAD dialog, prompting the user to make a selection.
Defaults to "Select items".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Select items
Accept pipeline input: False
Accept wildcard characters: False
```

### -Width
The width of the YAD dialog window in pixels.
Defaults to 600.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 600
Accept pipeline input: False
Accept wildcard characters: False
```

### -Height
The height of the YAD dialog window in pixels.
Defaults to 400.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 400
Accept pipeline input: False
Accept wildcard characters: False
```

### -Separator
The separator used to join multiple selections when the dialog allows multiple selections.
Defaults to "|".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: |
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontName
The font name to use in the YAD dialog.
If not specified, the default system font will be used.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IconPath
The path to the icon to display in the YAD dialog.
Defaults to 'dialog-information'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: Dialog-information
Accept pipeline input: False
Accept wildcard characters: False
```

### -ImagePath
The path to the image to display in the YAD dialog.
Defaults to 'dialog-question'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: Dialog-question
Accept pipeline input: False
Accept wildcard characters: False
```

### -ButtonsLayout
The layout of the buttons in the YAD dialog.
Defaults to 'center'.
Valid values are 'center', 'edge', 'end', 'spread', and 'start'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: Center
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
This function requires YAD (Yet Another Dialog) to be installed on the system.
It is typically used in Linux environments where YAD is available.
To play with this directly, type 'yad --help' in a terminal.

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Out-GridForm.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Out-GridForm.md)

