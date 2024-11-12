---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DiskInfo.md
schema: 2.0.0
---

# Get-DiskInfo

## SYNOPSIS
Get local disk information

## SYNTAX

```
Get-DiskInfo [-FormatNumbers]
```

## DESCRIPTION
Get local disk information using the "df" command.

## EXAMPLES

### EXAMPLE 1
```
Get-DiskInfo
Enumerate all local disk information
```

### EXAMPLE 2
```
Get-DiskInfo -FormatNumbers
Enumerate all local disk information with formatted numbers
```

## PARAMETERS

### -FormatNumbers
Return number values in units (e.g.
12GB, 1.2TB, etc.)

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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DiskInfo.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DiskInfo.md)

