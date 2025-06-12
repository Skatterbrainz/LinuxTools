---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-DnfPackages.md
schema: 2.0.0
---

# Update-DnfPackages

## SYNOPSIS
Update DNF packages

## SYNTAX

```
Update-DnfPackages [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update DNF packages on a Linux system using the dnf package manager.

## EXAMPLES

### EXAMPLE 1
```
Update-DnfPackages
Updates all installed DNF packages to their latest versions.
```

## PARAMETERS

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
This function requires the dnf package manager to be installed on the system.
Ensure that you have the necessary permissions to run this command, as it may require superuser privileges.

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-DnfPackages.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-DnfPackages.md)

