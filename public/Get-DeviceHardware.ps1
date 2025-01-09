function Get-DeviceHardware {
	<#
	.SYNOPSIS
		Get hardware information for the current device
	.DESCRIPTION
		This script will gather hardware information for the current device.
	.PARAMETER None
		No parameters are required
	.EXAMPLE
		Get-DeviceHardware
		Returns hardware information for the current device
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DeviceHardware.md
	#>
	[CmdletBinding()]
	param()
	try {
		Invoke-Command -ScriptBlock { sudo lshw -json } | ConvertFrom-Json
	} catch {
		Write-Error $_.Exception.Message
	}
}