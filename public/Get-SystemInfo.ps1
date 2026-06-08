function Get-SystemInfo {
	<#
	.SYNOPSIS
		Gets system information from a Linux system.
	.DESCRIPTION
		Collects system information in basic or detailed mode.
	.PARAMETER Detail
		Detail level to return. Valid values are Basic or Detailed.
	.PARAMETER NeoFetch
		If specified, runs neofetch and returns its output instead of object data.
	.EXAMPLE
		Get-SystemInfo
	.EXAMPLE
		Get-SystemInfo -Detail Detailed
	#>
	[CmdletBinding()]
	param(
		[parameter()][ValidateSet('Basic','Detailed')][string]$Detail = 'Basic',
		[parameter()][switch]$NeoFetch
	)
	if ($NeoFetch) {
		if (-not (Get-Command -Name neofetch -ErrorAction SilentlyContinue)) {
			throw 'neofetch command not found'
		}
		Invoke-Command -ScriptBlock { neofetch }
		return
	}
	ReadLinuxSystemInfo -Detail $Detail.ToLowerInvariant()
}