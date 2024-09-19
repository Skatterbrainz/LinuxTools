---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ComputerInventory.md
schema: 2.0.0
---

# Get-ComputerInventory

## SYNOPSIS
Get-ComputerInventory
Get hardware and software inventory of the local computer.

## SYNTAX

```
Get-ComputerInventory [[-DestinationPath] <String>] [[-SasURI] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
This script will gather hardware and software inventory of the local computer and output the results to a JSON file.
Optionally, the results can be sent to a REST API endpoint.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -DestinationPath
{{ Fill DestinationPath Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SasURI
The Azure Storage Account SAS URI to send the inventory files to.
Format is https://\<storageaccount\>.blob.core.windows.net/\<container\>/\<blob\>?\<sas-token\>

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
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
1.0.0 - 2024-08-05 - Initial release, David Stein

Blob Container requires permissions: Add, Create, Write, List

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ComputerInventory.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ComputerInventory.md)

