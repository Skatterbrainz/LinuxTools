---
external help file: linuxtools-help.xml
Module Name: linuxtools
online version: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-TimeZone.md
schema: 2.0.0
---

# Get-TimeZone

## SYNOPSIS
Get current time zone setting

Gets the current time zone or a list of available time zones.

## SYNTAX

```
Get-TimeZone
```

## DESCRIPTION
Get current time zone setting

\> This cmdlet is only available on the Windows platform.
The \`Get-TimeZone\` cmdlet gets the current time zone or a list of available time zones.

## EXAMPLES

### EXAMPLE 1
```
Get-TimeZone
```

### Example 1: Get the current time zone
```
Get-TimeZone
```

This command gets the current time zone.

### Example 2: Get time zones that match a specified string
```
Get-TimeZone -Name "*pac*"

Pacific Standard Time (Mexico)

(UTC-08:00) Pacific Time (US &amp; Canada)

Pacific Standard Time

SA Pacific Standard Time

Pacific SA Standard Time

West Pacific Standard Time

Central Pacific Standard Time
```

This command gets all time zones that match the specified wildcard.

### Example 3: Get all available time zones
```
Get-TimeZone -ListAvailable
```

This command gets all available time zones.

## PARAMETERS

## INPUTS

### System.String[]
## OUTPUTS

### System.TimeZoneInfo[]
## NOTES
PowerShell includes the following aliases for \`Get-TimeZone\`:

- All platforms:   - \`gtz\`

## RELATED LINKS

[https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-TimeZone.md](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-TimeZone.md)

[Online Version:](https://learn.microsoft.com/powershell/module/microsoft.powershell.management/get-timezone?view=powershell-7.3&WT.mc_id=ps-gethelp)

[Set-TimeZone]()

