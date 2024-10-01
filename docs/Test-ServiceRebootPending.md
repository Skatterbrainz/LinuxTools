---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Test-ServiceRebootPending.md
schema: 2.0.0
---

# Test-ServiceRebootPending

## SYNOPSIS
Checks for services that need to be restarted.

## SYNTAX

```
Test-ServiceRebootPending [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Checks for services that need to be restarted.

## EXAMPLES

### EXAMPLE 1
```
Test-ServiceRebootPending
Checks for services that need to be restarted.
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
Display services which need to be restarted, because they are still
using old copies of libraries.
Written by Richard W.M.
Jones \<rjones@redhat.com\>
License: GNU General Public License version 2 or above
Requires:
- lsof
- systemctl
source: https://github.com/atc0005/needs-restart/blob/master/needs-restart.pl

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Test-ServiceRebootPending.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Test-ServiceRebootPending.md)

