function Get-TimeZone {
	<#
	.SYNOPSIS
		Get current time zone setting
	.DESCRIPTION
		Get current time zone setting
	.PARAMETER (none)
		No parameters
	.EXAMPLE
		Get-TimeZone
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-TimeZone.md
	#>
	param()
	# adjust path based on linux distro
	if (Test-Path -Path '/etc/timezone') {
		Invoke-Command -ScriptBlock { cat /etc/timezone }
	}
	elseif (Test-Path -Path '/etc/localtime') {
		Invoke-Command -ScriptBlock { readlink /etc/localtime } # returns "../usr/share/zoneinfo/Region/City"
	}
}
