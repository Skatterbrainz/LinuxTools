function Get-SerialNumber {
	<#
	.SYNOPSIS
		Gets the serial number of the system.
	.DESCRIPTION
		Gets the serial number of the system.
	.EXAMPLE
		Get-SerialNumber
		Returns the serial number of the system.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SerialNumber.md
	#>
	[CmdletBinding()]
	[OutputType([string])]
	param ()
	try {
		sudo dmidecode -s system-serial-number
	} catch {
		Write-Error $_.Exception.Message
	}
}