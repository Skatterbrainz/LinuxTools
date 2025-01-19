---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-OpenFiles.md
schema: 2.0.0
---

# Get-OpenFiles

## SYNOPSIS
Get open files on a Linux system.

## SYNTAX

```
Get-OpenFiles [[-Path] <String>] [[-UserName] <String[]>] [[-ProcessId] <Int32[]>] [-IPv4] [-IPv6]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get open files on a Linux system.
This cmdlet uses the lsof command to list open files on a Linux system.

## EXAMPLES

### EXAMPLE 1
```
Get-OpenFiles -Path /tmp
Get open files in the /tmp directory.
```

### EXAMPLE 2
```
Get-OpenFiles -UserName root
Get open files owned by the root user.
```

### EXAMPLE 3
```
Get-OpenFiles -ProcessId 1234
Get open files for process ID 1234.
```

### EXAMPLE 4
```
Get-OpenFiles -IPv4
Get open files using IPv4.
```

### EXAMPLE 5
```
Get-OpenFiles -Path /home/user123 -UserName user123
Get open files in the /home/user123 directory owned by the user123 user.
```

## PARAMETERS

### -Path
Filter by path.

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

### -UserName
Filter by user name.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProcessId
Filter by process ID.

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IPv4
Filter by IPv4.

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

### -IPv6
Filter by IPv6.

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

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-OpenFiles.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-OpenFiles.md)

