---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-NetworkInfo.md
schema: 2.0.0
---

# Get-NetworkInfo

## SYNOPSIS
Get basic network information

## SYNTAX

```
Get-NetworkInfo [-IncludePublicIP] [[-PublicResolver] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get basic network information, including local IP address, default gateway, DNS servers, MAC address, and subnet mask.

## EXAMPLES

### EXAMPLE 1
```
Get-NetworkInfo
```

### EXAMPLE 2
```
Get-NetworkInfo -IncludePublicIP
```

### EXAMPLE 3
```
Get-NetworkInfo -IncludePublicIP -PublicResolver 'https://checkip.amazonaws.com'
```

## PARAMETERS

### -IncludePublicIP
Include the public IP address in the output

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PublicResolver
URI to a public IP address resolver service

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Http://ipconfig.me/ip
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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-NetworkInfo.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-NetworkInfo.md)

