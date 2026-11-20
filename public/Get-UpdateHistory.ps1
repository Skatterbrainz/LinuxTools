function Get-UpdateHistory {
	<#
	.SYNOPSIS
		Retrieves the update history from the system's package manager logs.
	
	.DESCRIPTION
		Retrieves and parses update history events from package manager logs and history commands, optionally 
		filtered by a search pattern, start date, end date, and whether to include archived logs.
		Works with apt, zypper, snap, dnf, yum, and flatpak package managers.
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
	#region helper functions
	function New-UpdateHistoryEvent {
		param(
			[Parameter(Mandatory = $true)]
			[string]$PackageManager,
			[Parameter(Mandatory = $false)]
			[Nullable[datetime]]$StartDate,
			[Parameter(Mandatory = $false)]
			[Nullable[datetime]]$EndDate,
			[Parameter(Mandatory = $false)]
			[string]$CommandLine,
			[Parameter(Mandatory = $false)]
			[string]$RequestedBy,
			[Parameter(Mandatory = $false)]
			[string]$Install,
			[Parameter(Mandatory = $false)]
			[string]$Upgrade,
			[Parameter(Mandatory = $false)]
			[string]$Remove,
			[Parameter(Mandatory = $false)]
			[string]$Purge,
			[Parameter(Mandatory = $false)]
			[string]$Downgrade,
			[Parameter(Mandatory = $false)]
			[string]$Reinstall,
			[Parameter(Mandatory = $false)]
			[string]$SourceFile,
			[Parameter(Mandatory = $false)]
			[string]$RawEvent
		)
		[PSCustomObject]@{
			PackageManager = $PackageManager
			StartDate      = $StartDate
			EndDate        = $EndDate
			CommandLine    = $CommandLine
			RequestedBy    = $RequestedBy
			Install        = $Install
			Upgrade        = $Upgrade
			Remove         = $Remove
			Purge          = $Purge
			Downgrade      = $Downgrade
			Reinstall      = $Reinstall
			SourceFile     = $SourceFile
			RawEvent       = $RawEvent
		}
	}
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
		New-UpdateHistoryEvent `
			-PackageManager 'apt' `
			-StartDate $(if ($hasStartDate) { $startDateTime } else { $null }) `
			-EndDate $(if ($hasEndDate) { $endDateTime } else { $null }) `
			-CommandLine $fields['Commandline'] `
			-RequestedBy $fields['Requested-By'] `
			-Install $fields['Install'] `
			-Upgrade $fields['Upgrade'] `
			-Remove $fields['Remove'] `
			-Purge $fields['Purge'] `
			-Downgrade $fields['Downgrade'] `
			-Reinstall $fields['Reinstall'] `
			-SourceFile $Source `
			-RawEvent (($Block -join "`n").Trim())
	}
	function Get-AptHistoryEvents {
		param(
			[Parameter(Mandatory = $true)]
			[object[]]$Block,
			[Parameter(Mandatory = $true)]
			[string]$Source
		)
		$events = @()
		$currentBlock = @()
		foreach ($line in $Block) {
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
	function Get-YumHistoryEvents {
		param(
			[Parameter(Mandatory = $true)]
			[object[]]$Block,
			[Parameter(Mandatory = $true)]
			[string]$Source
		)
		$events = @()
		foreach ($line in $Block) {
			$rawLine = [string]$line
			if ([string]::IsNullOrWhiteSpace($rawLine)) { continue }
			if ($rawLine -match '^\s*ID\s*\|') { continue }
			if ($rawLine -match '^\s*-+\s*$') { continue }
			if ($rawLine -match '^\s*(?<Id>\d+)\s*\|(?<User>[^|]*)\|(?<DateTime>[^|]*)\|(?<Actions>[^|]*)\|(?<Altered>.+)$') {
				$parsedDate = [datetime]::MinValue
				$dateText = $matches['DateTime'].Trim()
				$hasParsedDate = [datetime]::TryParse(
					$dateText,
					[System.Globalization.CultureInfo]::InvariantCulture,
					[System.Globalization.DateTimeStyles]::AllowWhiteSpaces,
					[ref]$parsedDate
				)
				if (-not $hasParsedDate) {
					$hasParsedDate = [datetime]::TryParse(
						$dateText,
						[System.Globalization.CultureInfo]::CurrentCulture,
						[System.Globalization.DateTimeStyles]::AllowWhiteSpaces,
						[ref]$parsedDate
					)
				}
				$events += New-UpdateHistoryEvent `
					-PackageManager 'yum' `
					-StartDate $(if ($hasParsedDate) { $parsedDate } else { $null }) `
					-CommandLine 'sudo yum history list' `
					-RequestedBy $matches['User'].Trim() `
					-SourceFile $Source `
					-RawEvent ("ID={0}; DateTime={1}; Actions={2}; Altered={3}" -f $matches['Id'].Trim(), $dateText, $matches['Actions'].Trim(), $matches['Altered'].Trim())
				continue
			}
			$events += New-UpdateHistoryEvent -PackageManager 'yum' -CommandLine 'sudo yum history list' -SourceFile $Source -RawEvent $rawLine
		}
		$events
	}
	function Get-FlatpakHistoryEvents {
		param(
			[Parameter(Mandatory = $true)]
			[string]$Source
		)
		$events = @()
		$history = flatpak history
		foreach ($line in $history) {
			$events += New-UpdateHistoryEvent -PackageManager 'flatpak' -SourceFile $Source -RawEvent ([string]$line)
		}
		$events
	}
	function Get-SnapHistoryEvents {
		param(
			[Parameter(Mandatory = $true)]
			[object[]]$Block,
			[Parameter(Mandatory = $true)]
			[string]$Source
		)
		$events = @()
		foreach ($line in $Block) {
			$events += New-UpdateHistoryEvent -PackageManager 'snap' -SourceFile $Source -RawEvent ([string]$line)
		}
		$events
	}
	function Get-ZypperHistoryEvents {
		param(
			[Parameter(Mandatory = $true)]
			[object[]]$Block,
			[Parameter(Mandatory = $true)]
			[string]$Source
		)
		$events = @()
		foreach ($line in $Block) {
			$events += New-UpdateHistoryEvent -PackageManager 'zypper' -SourceFile $Source -RawEvent ([string]$line)
		}
		$events
	}
	function Get-DnfHistoryEvents {
		param(
			[Parameter(Mandatory = $true)]
			[object[]]$Block,
			[Parameter(Mandatory = $true)]
			[string]$Source
		)
		$events = @()
		foreach ($line in $Block) {
			$events += New-UpdateHistoryEvent -PackageManager 'dnf' -SourceFile $Source -RawEvent ([string]$line)
		}
		$events
	}
	#endregion

	# also any rollback logs if available, such as gzipped logs: zgrep -h "Start-Date\|Upgrade:" /var/log/apt/history.log*
	$distro = (cat /etc/os-release | grep '^ID=' | cut -d'=' -f2).Trim('"')
	Write-Host "Detected Linux distribution: $distro"

	$packageManagers = @()

	if (Get-Command "apt" -ErrorAction SilentlyContinue) {
		$aptLogPath = '/var/log/apt/history.log'
		$aptArchived = '/var/log/apt/history.log.*.gz'
		$packageManagers += @{ Name = 'apt' ; LogPath = $aptLogPath }
	}
	if (Get-Command "yum" -ErrorAction SilentlyContinue) {
		$packageManagers += @{ Name = 'yum' ; LogPath = $null }
	}
	if (Get-Command "dnf" -ErrorAction SilentlyContinue) {
		$dnfLogPath = '/var/log/dnf.log'
		$packageManagers += @{ Name = 'dnf' ; LogPath = $dnfLogPath }
	}
	if (Get-Command "snap" -ErrorAction SilentlyContinue) {
		# do not rely on a log file but use: snap changes --abs-time
		$packageManagers += @{ Name = 'snap' ; LogPath = $null }
	}
	if (Get-Command "zypper" -ErrorAction SilentlyContinue) {
		$zypperLogPath = '/var/log/zypper.log'
		$packageManagers += @{ Name = 'zypper' ; LogPath = $zypperLogPath }
	}
	if (Get-Command "flatpak" -ErrorAction SilentlyContinue) {
		# do not rely on a log file but use: flatpak history
		$packageManagers += @{ Name = 'flatpak' ; LogPath = $null }
	}

	$events = @()

	foreach ($pm in $packageManagers) {
		Write-Verbose "Detected package manager: $($pm.Name)"
		if ($pm.Name -eq 'flatpak') {
			$events += Get-FlatpakHistoryEvents -Source 'flatpak'
			continue
		}
		if ($pm.Name -eq 'snap') {
			$events += Get-SnapHistoryEvents -Block (snap changes --abs-time) -Source 'snap changes --abs-time'
			continue
		}
		if ($pm.Name -eq 'yum') {
			$events += Get-YumHistoryEvents -Block (& sudo yum history list) -Source 'sudo yum history list'
			continue
		}
		foreach ($logPath in $pm.LogPath) {
			Write-Verbose "Log path: $logPath"
			if ($pm.Name -eq 'apt') {
				# Process the apt log file
				$logFiles = @($logPath)
				if ($IncludeArchived -and $aptArchived) {
					$logFiles += (Get-ChildItem -Path $aptArchived -ErrorAction SilentlyContinue | Sort-Object -Property Name | Select-Object -ExpandProperty FullName)
				}
				foreach ($file in $logFiles) {
					Write-Verbose "Processing apt log file: $file"
					if (-not (Test-Path -Path $file)) { continue }
					$events += Get-AptHistoryEvents -Block (Get-Content -Path $file) -Source $file
				}
			}
			if ($pm.Name -eq 'dnf') {
				# Process the dnf log file
				$events += Get-DnfHistoryEvents -Block (Get-Content -Path $logPath) -Source $logPath
			}
			if ($pm.Name -eq 'snap') {
				# Process the snap log file
				$events += Get-SnapHistoryEvents -Block (Get-Content -Path $logPath) -Source $logPath
			}
			if ($pm.Name -eq 'zypper') {
				# Process the zypper log file
				$events += Get-ZypperHistoryEvents -Block (Get-Content -Path $logPath) -Source $logPath
			}
			if ($pm.Name -eq 'flatpak') {
				# handled before log-path loop
			}
		}
	} # foreach ($pm in $packageManagers)

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