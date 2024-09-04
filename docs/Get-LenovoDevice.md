---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LenovoDevice.md
schema: 2.0.0
---

# Get-LenovoDevice

## SYNOPSIS
Get Lenovo device information

## SYNTAX

```
Get-LenovoDevice [[-SerialNumber] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get Lenovo device information using the Lenovo API.

## EXAMPLES

### EXAMPLE 1
```
Get-LenovoDevice
```

### EXAMPLE 2
```
Get-LenovoDevice -SerialNumber "1234567890"
```

## PARAMETERS

### -SerialNumber
Optional.
Specify the serial number of the Lenovo device.
If not specified, the script will attempt to retrieve it from the system.

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
Inspired by Damien Van Robaeys' blog post: https://www.vansurksum.com/2021/02/08/get-lenovo-warranty-information-using-powershell/

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LenovoDevice.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LenovoDevice.md)

