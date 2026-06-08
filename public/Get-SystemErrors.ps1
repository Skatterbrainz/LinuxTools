function Get-SystemErrors {
	<#
	.SYNOPSIS
		Gets error events from common Linux log sources.
	.DESCRIPTION
		Aggregates error entries from journalctl, syslog, auth.log, and xsession logs.
	.PARAMETER Source
		Log source to query. Valid values are all, journal, syslog, auth, or xsession.
	.PARAMETER Since
		Time window used by journalctl, for example "-24h" or "today".
	.PARAMETER Severity
		Journal severity level filter.
	.PARAMETER Lines
		Maximum number of lines to return per source.
	.EXAMPLE
		Get-SystemErrors
		Returns recent error entries from all available sources.
	.EXAMPLE
		Get-SystemErrors -Source journal -Since "-2h" -Severity warning -Lines 100
		Returns journal errors for the last two hours.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SystemErrors.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][ValidateSet('all','journal','syslog','auth','xsession')][string]$Source = 'all',
		[parameter()][string]$Since = '-24h',
		[parameter()][ValidateSet('emerg','alert','crit','err','warning','notice','info','debug')][string]$Severity = 'err',
		[parameter()][int]$Lines = 200
	)
	try {
		$targets = if ($Source -eq 'all') { @('journal','syslog','auth','xsession') } else { @($Source) }
		$results = @()
		foreach ($target in $targets) {
			switch ($target) {
				'journal' {
					if (Get-Command -Name journalctl -ErrorAction SilentlyContinue) {
						$rows = journalctl -p $Severity --since "$Since" -n $Lines --no-pager 2>$null
						foreach ($row in $rows) {
							if ([string]::IsNullOrWhiteSpace($row)) { continue }
							$results += [pscustomobject]@{
								SourceType = 'journal'
								Source     = 'journal'
								Entry      = $row
							}
						}
					}
				}
				'syslog' {
					if (Test-Path -Path '/var/log/syslog') {
						$rows = Get-Content -Path '/var/log/syslog' -Tail $Lines -ErrorAction SilentlyContinue |
							Where-Object { $_ -match '(error|fail|critical|panic)' }
						foreach ($row in $rows) {
							$results += [pscustomobject]@{
								SourceType = 'syslog'
								Source     = 'syslog'
								Entry      = $row
							}
						}
					}
				}
				'auth' {
					if (Test-Path -Path '/var/log/auth.log') {
						$rows = Get-Content -Path '/var/log/auth.log' -Tail $Lines -ErrorAction SilentlyContinue |
							Where-Object { $_ -match '(error|fail|denied|invalid)' }
						foreach ($row in $rows) {
							$results += [pscustomobject]@{
								SourceType = 'auth'
								Source     = 'auth'
								Entry      = $row
							}
						}
					}
				}
				'xsession' {
					$xsessionPath = "$env:HOME/.xsession-errors"
					if (Test-Path -Path $xsessionPath) {
						$rows = Get-Content -Path $xsessionPath -Tail $Lines -ErrorAction SilentlyContinue |
							Where-Object { $_ -match '(error|fail|critical|warning)' }
						foreach ($row in $rows) {
							$results += [pscustomobject]@{
								SourceType = 'xsession'
								Source     = 'xsession'
								Entry      = $row
							}
						}
					}
				}
			}
		}
		$results
	} catch {
		Write-Error $($_.Exception.Message -join(';'))
	}
}