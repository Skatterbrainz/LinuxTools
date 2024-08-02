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
	Invoke-Command -ScriptBlock { cat /etc/timezone }
}
