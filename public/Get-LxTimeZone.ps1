<#
.SYNOPSIS
Get current time zone setting

.DESCRIPTION
Get current time zone setting

.PARAMETER (none)

.EXAMPLE
Get-LxTimeZone

.LINK
https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LxTimeZone.md
#>
function Get-LxTimeZone {
	param()
	Invoke-Command -ScriptBlock { cat /etc/timezone }
}
