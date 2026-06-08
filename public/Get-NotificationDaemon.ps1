function Get-NotificationDaemon {
	<#
	.SYNOPSIS
		Gets active desktop notification daemon processes.
	.DESCRIPTION
		Checks common Linux notification daemon processes and returns those currently running.
	.EXAMPLE
		Get-NotificationDaemon
		Returns active notification daemon processes.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-NotificationDaemon.md
	#>
	[CmdletBinding()]
	param()
	try {
		$candidates = @(
			'dunst',
			'notification-daemon',
			'mate-notification-daemon',
			'xfce4-notifyd',
			'knotify5',
			'plasma_waitforname'
		)
		$results = @()
		foreach ($name in $candidates) {
			if (Get-Command -Name pgrep -ErrorAction SilentlyContinue) {
				$pids = pgrep -x $name 2>$null
				foreach ($pid in $pids) {
					$results += [pscustomobject]@{
						Name = $name
						PID  = [int]$pid
					}
				}
			}
		}
		$results | Sort-Object Name, PID -Unique
	} catch {
		Write-Error $($_.Exception.Message -join(';'))
	}
}