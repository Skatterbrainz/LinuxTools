function Get-DegradedSystemInfo {
	<#
	.SYNOPSIS
		Get-DegradedSystemInfo retrieves systemctl --failed information
	.DESCRIPTION
		Get-DegradedSystemInfo retrieves systemctl --failed information
	.EXAMPLE
		Get-DegradedSystemInfo
		Get-DegradedSystemInfo retrieves systemctl --failed information
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DegradedSystemInfo.md
	#>
	param()
	$systemctl = Get-Command systemctl -ErrorAction SilentlyContinue
	if ($systemctl) {
		Invoke-Command -ScriptBlock {systemctl --failed}
	} else {
		Write-Warning "systemctl command not found"
	}
}