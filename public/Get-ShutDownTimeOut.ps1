function Get-ShutDownTimeOut {
	<#
	.SYNOPSIS
		Get-ShutDownTimeOut retrieves the shutdown timeout value
	.DESCRIPTION
		Get-ShutDownTimeOut retrieves the shutdown timeout value from the systemd configuration file
	.EXAMPLE
		Get-ShutDownTimeOut
		Get-ShutDownTimeOut retrieves the shutdown timeout value
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ShutDownTimeOut.md
	#>
	param()
	if (Test-Path '/etc/systemd/system.conf.d/60_linuxmint.conf'){
		$confFile = '/etc/systemd/system.conf.d/60_linuxmint.conf'
		$confType = 'Custom'
	} else {
		$confFile = '/etc/systemd/system.conf.d/50_linuxmint.conf'		
		$confType = 'Default'
	}
	$timeout = Get-Content -Path $confFile | Where-Object {$_ -match 'DefaultTimeoutStopSec'} | ForEach-Object {$_ -replace 'DefaultTimeoutStopSec=', ''}
	$timeout
}