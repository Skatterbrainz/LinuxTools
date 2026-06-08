function Get-ComputerInfo {
	<#
	.SYNOPSIS
		Get computer and operating system info
	.DESCRIPTION
		Compatibility wrapper for Get-SystemInfo.
		By default this returns detailed system information.
	.PARAMETER NeoFetch
		Optional. Use the NeoFetch command to display system information.
	.EXAMPLE
		Get-ComputerInfo
	.EXAMPLE
		Get-ComputerInfo -NeoFetch
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ComputerInfo.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][switch]$NeoFetch
	)
	if ($NeoFetch) {
		Get-SystemInfo -NeoFetch
		return
	}
	Get-SystemInfo -Detail Detailed
}