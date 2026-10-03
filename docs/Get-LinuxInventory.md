---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxInventory.md
Locale: en-US
Module Name: linuxtools
ms.date: 10/03/2026
PlatyPS schema version: 2024-05-01
title: Get-LinuxInventory
---

# Get-LinuxInventory

## SYNOPSIS

Displays hardware and software inventory for the local Linux computer.

## SYNTAX

### __AllParameterSets

```powershell
Get-LinuxInventory [[-ExportPath] <string>] [[-Category] <string>] [<CommonParameters>]
```

## DESCRIPTION

Collects inventory data across OS, hardware, storage, network, installed software, video,
and audio categories. Use `-Category` to limit collection for faster execution.

## EXAMPLES

### EXAMPLE 1

```powershell
Get-LinuxInventory
```

Returns full inventory.

### EXAMPLE 2

```powershell
Get-LinuxInventory -Category Video
```

Returns only video inventory details.

### EXAMPLE 3

```powershell
Get-LinuxInventory -Category Audio
```

Returns only audio inventory details.

## PARAMETERS

### -ExportPath

Output path for inventory report export.

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

### -Category

Limits inventory collection to a specific category.

Valid values:
- `All`
- `OperatingSystem`
- `ComputerSystem`
- `BIOS`
- `Processor`
- `Disks`
- `NetworkInterfaces`
- `InstalledApplications`
- `Video`
- `Audio`

```yaml
Type: System.String
DefaultValue: All
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
AcceptedValues: [All, OperatingSystem, ComputerSystem, BIOS, Processor, Disks, NetworkInterfaces, InstalledApplications, Video, Audio]
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSCustomObject

Returns a structured inventory object with nested category properties.

## RELATED LINKS

- [Get-LinuxInventory source](https://github.com/Skatterbrainz/linuxtools/blob/master/public/Get-LinuxInventory.ps1)
