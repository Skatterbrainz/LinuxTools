function Get-SystemLocks {
	<#
	.SYNOPSIS
		Get system locks
	.DESCRIPTION
	.PARAMETER name
	.EXAMPLE
		Get-SystemLocks

		Returns current system locks
	.EXAMPLE
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SystemLocks.md
	#>
	[CmdletBinding()]
	param()
	try {
		if (!(Test-Path -Path '/usr/bin/lslocks')) {
			throw "File not found: lslocks"
		}
		lslocks --json | ConvertFrom-Json | Select-Object -ExpandProperty locks
	} catch {
		Write-Error $_.Exception.Message
	}
}