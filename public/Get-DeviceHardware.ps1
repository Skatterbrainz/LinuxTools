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
	param(
		[parameter()][switch]$Json
	)
	try {
		if ($Json.IsPresent) {
			# Get hardware information in JSON format
			$hardwareInfo = Invoke-Command -ScriptBlock { sudo lshw -json } | ConvertFrom-Json
			return $hardwareInfo
		} else {}
		Invoke-Command -ScriptBlock { sudo lshw -json } | ConvertFrom-Json
	} catch {
		Write-Error $_.Exception.Message
	}
}