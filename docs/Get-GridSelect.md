---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-FlatpakInventory.md
schema: 2.0.0
---

# Get-GridSelect

## SYNOPSIS
Display a grid view of the specified data set and return the selected item(s)

## SYNTAX

```
Get-GridSelect [-DataSet] <Object> [-Title] <String> [[-OutputMode] <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Display a grid view of the specified data set and return the selected item(s)

## EXAMPLES

### EXAMPLE 1
```
Get-GridSelect -DataSet $users -Title "Select a User Account" -OutputMode Single
Display a grid view of the specified data set and return the selected item
```

### EXAMPLE 2
```
Get-GridSelect -DataSet $users -Title "Select User Accounts"
Display a grid view of the specified data set and return the selected item(s)
```

## PARAMETERS

### -DataSet
Specify the data set (array, arraylist, collection) to display in the grid view

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
Specify the title of the grid view window

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputMode
Specify the output mode: Single or Multiple.
Default is Multiple

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Multiple
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
