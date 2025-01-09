function Get-UsbDevices {
	<#
	.SYNOPSIS
		Get USB devices attached to the system
	.DESCRIPTION
		This script will gather USB devices attached to the system
	.PARAMETER None
		No parameters are required
	.EXAMPLE
		Get-UsbDevices
		Returns USB devices attached to the system
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-UsbDevices.md
	#>
	[CmdletBinding()]
	param()
	try {
		$usb = lsusb
		$usb | Select-Object @{n='Bus';e={$_.substring(4,3)}},@{n='Device';e={$_.substring(15,3)}},@{n='ID';e={$_.substring(23,9)}},@{n='Name';e={$_.substring(32).trim()}}
	} catch {
		Write-Error $_.Exception.Message
	}
}