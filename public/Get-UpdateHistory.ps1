function Get-UpdateHistory {
	<#
	.SYNOPSIS
		Retrieves the update history from the system's package manager logs.
	
	.DESCRIPTION
		Retrieves and parses update history events from the system's package manager logs, optionally filtered by a search pattern, start date, end date, and whether to include archived logs.
	.PARAMETER SearchPattern
		Optional. A string to filter the update history entries.
	.PARAMETER StartDate
		Optional. The start date to filter the update history entries.
	.PARAMETER EndDate
		Optional. The end date to filter the update history entries.
	.PARAMETER IncludeArchived
		Optional. Switch to include archived logs in the search.
	.EXAMPLE
		Get-UpdateHistory -SearchPattern "libnfs14" -StartDate "2026-11-01" -EndDate "2026-11-30"
		Retrieves all update history entries containing "libnfs14" between the specified start and end dates.
	.EXAMPLE
		Get-UpdateHistory -IncludeArchived
		Retrieves all parsed update history events, including those from archived logs.
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$false)]
		[string]$SearchPattern,
		[parameter(Mandatory=$false)]
		[datetime]$StartDate,
		[parameter(Mandatory=$false)]
		[datetime]$EndDate,
		[parameter(Mandatory=$false)]
		[switch]$IncludeArchived
	)
	function ConvertTo-AptHistoryEvent {
		param(
			[Parameter(Mandatory = $true)]
			[string[]]$Block,
			[Parameter(Mandatory = $true)]
			[string]$Source
		)
		$fields = @{}
		$currentField = $null
		foreach ($line in $Block) {
			if ([string]::IsNullOrWhiteSpace($line)) { continue }
			if ($line -match '^(?<Key>[A-Za-z-]+):\s*(?<Value>.*)$') {
				$currentField = $matches['Key']
				$fields[$currentField] = $matches['Value']
			} elseif ($currentField) {
				$fields[$currentField] = "$($fields[$currentField]) $($line.Trim())"
			}
		}
		if (-not $fields.ContainsKey('Start-Date')) { return $null }
		$startDateValue = $fields['Start-Date']
		$endDateValue   = $fields['End-Date']
		[datetime]$startDateTime = [datetime]::MinValue
		[datetime]$endDateTime = [datetime]::MinValue
		$hasStartDate = [datetime]::TryParse($startDateValue, [System.Globalization.CultureInfo]::InvariantCulture, [System.Globalization.DateTimeStyles]::AllowWhiteSpaces, [ref]$startDateTime)
		$hasEndDate = [datetime]::TryParse($endDateValue, [System.Globalization.CultureInfo]::InvariantCulture, [System.Globalization.DateTimeStyles]::AllowWhiteSpaces, [ref]$endDateTime)
		[PSCustomObject]@{
			StartDate   = if ($hasStartDate) { $startDateTime } else { $null }
			EndDate     = if ($hasEndDate) { $endDateTime } else { $null }
			Commandline = $fields['Commandline']
			RequestedBy = $fields['Requested-By']
			Install     = $fields['Install']
			Upgrade     = $fields['Upgrade']
			Remove      = $fields['Remove']
			Purge       = $fields['Purge']
			Downgrade   = $fields['Downgrade']
			Reinstall   = $fields['Reinstall']
			SourceFile  = $Source
			RawEvent    = ($Block -join "`n").Trim()
		}
	}
	function Get-AptHistoryEvents {
		param(
			[Parameter(Mandatory = $true)]
			[object[]]$Lines,
			[Parameter(Mandatory = $true)]
			[string]$Source
		)
		$events = @()
		$currentBlock = @()
		foreach ($line in $Lines) {
			$line = [string]$line
			if ([string]::IsNullOrWhiteSpace($line)) {
				if ($currentBlock.Count -gt 0) {
					$logevent = ConvertTo-AptHistoryEvent -Block $currentBlock -Source $Source
					if ($null -ne $logevent) { $events += $logevent }
					$currentBlock = @()
				}
				continue
			}
			$currentBlock += $line
		}
		if ($currentBlock.Count -gt 0) {
			$logevent = ConvertTo-AptHistoryEvent -Block $currentBlock -Source $Source
			if ($null -ne $logevent) { $events += $logevent }
		}
		$events
	}
	# check the Linux distro to determine what package managers are available and where the logs are
	# also any rollback logs if available, such as gzipped logs: zgrep -h "Start-Date\|Upgrade:" /var/log/apt/history.log*
	$distro = (cat /etc/os-release | grep '^ID=' | cut -d'=' -f2).Trim('"')
	switch ($distro) {
		'ubuntu' {
			# Ubuntu uses apt
			$logPath = '/var/log/apt/history.log'
			$archived = '/var/log/apt/history.log.*.gz'
		}
		'debian' {
			# Debian uses apt
			$logPath = '/var/log/apt/history.log'
			$archived = '/var/log/apt/history.log.*.gz'
		}
		'centos' {
			# CentOS uses yum
			$logPath = '/var/log/yum.log'
		}
		'fedora' {
			# Fedora uses dnf
			$logPath = '/var/log/dnf.log'
		}
		'linuxmint' {
			# based on Ubuntu
			$logPath = '/var/log/apt/history.log'
			$archived = '/var/log/apt/history.log.*.gz'
		}
		default {
			throw "Unsupported Linux distribution: $distro"
		}
	}
	
	if (!(Test-Path -Path $logPath)) {
		throw "Log path not found: $logPath"
	}

	if ($distro -in @('ubuntu', 'debian', 'linuxmint')) {
		$logFiles = @($logPath)
		if ($IncludeArchived -and $archived) {
			$logFiles += (Get-ChildItem -Path $archived -ErrorAction SilentlyContinue | Sort-Object -Property Name | Select-Object -ExpandProperty FullName)
		}
		$events = @()
		foreach ($file in $logFiles) {
			$lines = if ($file.EndsWith('.gz')) {
				if (-not (Get-Command zcat -ErrorAction SilentlyContinue)) {
					throw "The command 'zcat' is required to read archived apt history logs."
				}
				& zcat -f -- $file
			} else {
				Get-Content -Path $file
			}
			if ($null -eq $lines) { continue }
			if ($lines -is [string] -and [string]::IsNullOrWhiteSpace($lines)) { continue }
			$events += Get-AptHistoryEvents -Lines @($lines) -Source $file
		}

		if ($StartDate) {
			$events = $events | Where-Object { $null -ne $_.StartDate -and $_.StartDate -ge $StartDate }
		}
		if ($EndDate) {
			$events = $events | Where-Object { $null -ne $_.StartDate -and $_.StartDate -le $EndDate }
		}
		if (-not [string]::IsNullOrWhiteSpace($SearchPattern)) {
			$events = $events | Where-Object { $_.RawEvent -match $SearchPattern }
		}

		return $events
	}

	$pattern = if ([string]::IsNullOrWhiteSpace($SearchPattern)) { 'upgrade|install|remove|purge' } else { $SearchPattern }
	Get-Content -Path $logPath | Select-String -Pattern $pattern
}