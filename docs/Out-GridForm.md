---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Out-GridForm.md
Locale: en-US
Module Name: linuxtools
ms.date: 10/03/2026
PlatyPS schema version: 2024-05-01
title: Out-GridForm
---

# Out-GridForm

## SYNOPSIS

Displays pipeline objects in a selectable grid form using PyQt5.

## SYNTAX

### __AllParameterSets

```powershell
Out-GridForm [-InputObject] <PSObject[]> [[-Title] <string>] [[-OutputMode] <string>]
 [[-NumSortColumn] <string[]>] [<CommonParameters>]
```

## DESCRIPTION

Collects input objects from the pipeline, renders them in a sortable table dialog, and returns
selected rows as objects. This implementation uses Python 3 + PyQt5.

## EXAMPLES

### EXAMPLE 1

```powershell
Get-Process | Out-GridForm -Title "Select Process" -OutputMode Single
```

Displays process data and returns one selected row.

### EXAMPLE 2

```powershell
Get-Process | Out-GridForm -Title "Select Processes" -OutputMode Multiple
```

Displays process data and returns multiple selected rows.

### EXAMPLE 3

```powershell
Get-Process | Out-GridForm -Title "Select Processes" -OutputMode Multiple -NumSortColumn CPU
```

Marks the `CPU` column for numeric sorting.

## PARAMETERS

### -InputObject

Objects to display in the grid.

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

### -Title

Window title for the dialog.

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

### -OutputMode

Selection mode for the dialog.
Valid values: `Single`, `Multiple`.

```yaml
Type: System.String
DefaultValue: Single
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
AcceptedValues: [Single, Multiple]
HelpMessage: ''
```

### -NumSortColumn

Column names that should sort numerically instead of lexicographically.

```yaml
Type: System.String[]
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Management.Automation.PSObject

## OUTPUTS

### System.Management.Automation.PSCustomObject

Selected rows from the grid.

## NOTES

Requires `python3` and `PyQt5` on the host system.

## RELATED LINKS

- [Out-GridForm source](https://github.com/Skatterbrainz/linuxtools/blob/master/public/Out-GridForm.ps1)
