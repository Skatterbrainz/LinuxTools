---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DesktopEntries.md
Locale: en-US
Module Name: linuxtools
ms.date: 06/07/2026
PlatyPS schema version: 2024-05-01
title: Get-DesktopEntries
---

# Get-DesktopEntries

## SYNOPSIS

Gets desktop entry files from user, system, or autostart locations.

## SYNTAX

### __AllParameterSets

```
Get-DesktopEntries [[-Location] <string>] [[-Name] <string>] [-Contents] [[-Path] <string>] [[-Filter] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Queries `.desktop` entry files and returns metadata with optional file contents.

## EXAMPLES

### EXAMPLE 1

Get-DesktopEntries -Location User

Returns user desktop entries.

### EXAMPLE 2

Get-DesktopEntries -Location AutoStart -Name firefox -Contents

Returns matching autostart entry content.

## PARAMETERS

### -Location

Location scope to query.
Valid values are "User", "System", "AutoStart", or "All".

```yaml
Type: System.String
DefaultValue: User
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

### -Name

Optional name filter for desktop entries.

```yaml
Type: System.String
DefaultValue: ''
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

### -Contents

If present, includes each matching desktop file content.

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

### -Path

Optional path override, only used when Location is AutoStart.

```yaml
Type: System.String
DefaultValue: ''
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

### -Filter

File filter pattern.

```yaml
Type: System.String
DefaultValue: '*.desktop'
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

## OUTPUTS

## NOTES

`Get-AppLaunchers` and `Get-AutoStartApps` are compatibility wrappers over this command.

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DesktopEntries.md)
- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AppLaunchers.md)
- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AutoStartApps.md)