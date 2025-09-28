---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ComputerInventory.md
Locale: en-US
Module Name: linuxtools
ms.date: 09/27/2025
PlatyPS schema version: 2024-05-01
title: Get-ComputerInventory
---

# Get-ComputerInventory

## SYNOPSIS

Get hardware and software inventory of the local computer.

## SYNTAX

### __AllParameterSets

```
Get-ComputerInventory [[-DestinationPath] <string>] [[-SasURI] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This script will gather hardware and software inventory of the local computer and output the results to a JSON file.
Optionally, the results can be sent to a REST API endpoint.

## EXAMPLES

### EXAMPLE 1

Get-ComputerInventory -DestinationPath "\\server\share"

Saves the inventory file to \\server\share.
The file name is <hostname>_inventory.json

### EXAMPLE 2

.blob.core.windows.net/<container>/<blob>?<sas-token>"

Sends the inventory file to Azure Blob Storage.
The file name is <hostname>_inventory.json

### EXAMPLE 3

Get-ComputerInventory

Saves the inventory file to the user's Documents folder.
File name is <hostname>_inventory.json

## PARAMETERS

### -DestinationPath

{{ Fill DestinationPath Description }}

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

### -SasURI

Optional SAS URI for an Azure Storage Account to upload the inventory file to.
Format is https://<storageaccount>.blob.core.windows.net/<container>/<blob>?<sas-token>

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

Azure Blob Container requires permissions: Add, Create, Write, List

Any data missing? Let me know!


## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ComputerInventory.md)
