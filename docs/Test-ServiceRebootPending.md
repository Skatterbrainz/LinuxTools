---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Test-ServiceRebootPending.md
Locale: en-US
Module Name: linuxtools
ms.date: 08/02/2025
PlatyPS schema version: 2024-05-01
title: Test-ServiceRebootPending
---

# Test-ServiceRebootPending

## SYNOPSIS

Checks for services that need to be restarted.

## SYNTAX

### __AllParameterSets

```
Test-ServiceRebootPending [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Checks for services that need to be restarted.

## EXAMPLES

### EXAMPLE 1

Test-ServiceRebootPending
Checks for services that need to be restarted.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

Display services which need to be restarted, because they are still
using old copies of libraries.
Written by Richard W.M.
Jones <rjones@redhat.com>
License: GNU General Public License version 2 or above
Requires:
- lsof
- systemctl
source: https://github.com/atc0005/needs-restart/blob/master/needs-restart.pl


## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Test-ServiceRebootPending.md)
