---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-Keyring.md
Locale: en-US
Module Name: linuxtools
ms.date: 10/03/2026
PlatyPS schema version: 2024-05-01
title: Get-Keyring
---

# Get-Keyring

## SYNOPSIS

Gets Linux APT keyring files.

## SYNTAX

### __AllParameterSets

```powershell
Get-Keyring [[-Name] <string>] [<CommonParameters>]
```

## DESCRIPTION

Returns `.gpg` keyring files from `/etc/apt/trusted.gpg.d/`.
Use `-Name` to filter by a partial file name.

## EXAMPLES

### EXAMPLE 1

```powershell
Get-Keyring
```

Returns all discovered keyring files.

### EXAMPLE 2

```powershell
Get-Keyring -Name microsoft
```

Returns keyring files where the file name contains `microsoft`.

## PARAMETERS

### -Name

Optional name filter.

```yaml
Type: System.String
DefaultValue: ''
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.IO.FileInfo

## RELATED LINKS

- [Get-Keyring source](https://github.com/Skatterbrainz/linuxtools/blob/master/public/Get-Keyring.ps1)
