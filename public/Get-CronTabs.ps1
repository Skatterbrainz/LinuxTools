function Get-CronTabs {
	<#
	.SYNOPSIS
		Get the list of cron jobs. If a file is specified, it will return the contents of that file.
	.DESCRIPTION
		This function reads the contents of a cron file and returns the list of cron jobs.
	.PARAMETER CronTabFile
		The name of the cron file to read. If not provided, it will list all cron files in /etc/cron.d.
	.PARAMETER Path
		The path to the cron files. Default is /etc/cron.d.
	.EXAMPLE
		Get-CronTabs -CronTabFile "mycronjob"
		Returns the list of cron jobs in the file /etc/cron.d/mycronjob.
	.EXAMPLE
		Get-CronTabs
		Returns the list of cron files in /etc/cron.d.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CronTabs.md
	#>
	param (
		[parameter()][string]$CronTabFile,
		[parameter()][string]$Path = "/etc/cron.d"
	)
	if (![string]::IsNullOrEmpty($cronTabFile)) {
		$filepath = Join-Path $Path $CronTabFile
		if (-not (Test-Path -Path $filepath)) {
			Write-Error "The file $filepath does not exist."
		} else {
			$crontab = Get-Content -Path $filepath
			$crontab | ForEach-Object {
				$line = $_
				if ($line.Length -gt 0) {
					if ($line -notmatch '^#' -and $line -notmatch 'SHELL=' -and $line -notmatch 'PATH=') {
						$parts   = $line -split '\s+'
						$minute  = $parts[0]
						$hour    = $parts[1]
						$day     = $parts[2]
						$month   = $parts[3]
						$weekday = $parts[4]
						$command = $parts[5..100] -join ' '
					} elseif ($line -match "#") {
						$comment = $($line -replace '^#').Trim()
					}
					if ($minute) {
						[PSCustomObject]@{
							Minute  = $minute
							Hour    = $hour
							Day     = $day
							Month   = $month
							Weekday = $weekday
							Command = $command
							Comment = $comment
						}
					}
				}
			}
		}
	} else {
		Get-ChildItem -Path $Path -File -ErrorAction SilentlyContinue |
			Select-Object FullName,CreationTime,LastWriteTime,Length
	}
}
