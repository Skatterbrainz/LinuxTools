---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-MemoryPressure.md
Locale: en-US
Module Name: linuxtools
ms.date: 10/03/2026
PlatyPS schema version: 2024-05-01
title: Get-MemoryPressure
---

# Get-MemoryPressure

## SYNOPSIS

Gets current memory pressure metrics from Linux cgroup PSI data.

## SYNTAX

### __AllParameterSets

```powershell
Get-MemoryPressure [<CommonParameters>]
```

## DESCRIPTION

Reads memory pressure information and returns one object per PSI row (for example `some` and `full`),
including `avg10`, `avg60`, `avg300`, `total`, and a derived `Rating` value.

## EXAMPLES

### EXAMPLE 1

```powershell
Get-MemoryPressure
```

Returns current memory pressure rows and a `Rating` from 0 to 5.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSCustomObject

Properties include:
- `Type`
- `avg10`
- `avg60`
- `avg300`
- `total`
- `Rating`

## NOTES

`Rating` is derived from `avg10`:

- 0 = no pressure (`avg10 = 0`)
- 1 = minimal pressure (`avg10 > 0` and `<= 20`)
- 2 = low pressure (`avg10 > 20` and `<= 40`)
- 3 = moderate pressure (`avg10 > 40` and `<= 60`)
- 4 = high pressure (`avg10 > 60` and `<= 80`)
- 5 = critical pressure (`avg10 > 80`)

## RELATED LINKS

- [Get-MemoryPressure source](https://github.com/Skatterbrainz/linuxtools/blob/master/public/Get-MemoryPressure.ps1)
