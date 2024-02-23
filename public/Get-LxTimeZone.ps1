function Get-LxTimeZone {
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
	param()
	Invoke-Command -ScriptBlock { cat /etc/timezone }
}
