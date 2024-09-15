---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SysCtl.md
schema: 2.0.0
---

# Get-SysCtl

## SYNOPSIS
Get the value of sysctl parameters.

## SYNTAX

```
Get-SysCtl [[-Name] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the value of sysctl parameters, or for a specified parameter.

## EXAMPLES

### EXAMPLE 1
```
Get-SysCtl
```

Get all sysctl parameters.

### EXAMPLE 2
```
Get-SysCtl -Name vm.swappiness
```

Get the value of the vm.swappiness sysctl parameter.

## PARAMETERS

### -Name
The name of the sysctl parameter to get.
If not specified, all parameters are returned.

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

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SysCtl.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SysCtl.md)

