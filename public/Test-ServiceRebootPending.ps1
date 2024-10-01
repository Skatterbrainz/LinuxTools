function Test-ServiceRebootPending {
	<#
	.SYNOPSIS
		Checks for services that need to be restarted.
	.DESCRIPTION
		Checks for services that need to be restarted.
	.EXAMPLE
		Test-ServiceRebootPending
		Checks for services that need to be restarted.
	.NOTES
		Display services which need to be restarted, because they are still
		using old copies of libraries.
		Written by Richard W.M. Jones <rjones@redhat.com>
		License: GNU General Public License version 2 or above
		Requires:
		- lsof
		- systemctl
		source: https://github.com/atc0005/needs-restart/blob/master/needs-restart.pl
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Test-ServiceRebootPending.md
	#>
	[CmdletBinding()]
	param()

	# Parse lsof output.
	$lsofOutput = & lsof -F cpLfn
	$lines = $lsofOutput -split "`n"
	$procs = @()
	$pidx  = $null
	$comm  = $null
	$user  = $null
	$fd    = $null
	$file  = $null

	foreach ($line in $lines) {
		$line = $line.Trim()
		if ($line -match "^p(\d+)") {
			$pidx = $matches[1]
			continue
		} elseif ($line -match "^c(.*)") {
			$comm = $matches[1]
			continue
		} elseif ($line -match "^L(.*)") {
			$user = $matches[1]
			continue
		} elseif ($line -match "^f(.*)") {
			$fd = $matches[1]
			continue
		} elseif ($line -match "^n(.*)") {
			$file = $matches[1]
			$file = $file -replace ";[a-f0-9]{8}", ""
			if ($fd -eq "DEL" -and $file -match "\.so") {
				$procs += [PSCustomObject]@{
					comm = $comm
					pid  = $pidx
					user = $user
					file = $file
				}
			}
		}
	}

	$services_cache = @{}
	$pkgs_cache = @{}
	$pkgs_service_restart = @{}
	$pkgs_scope_restart = @{}
	$pkgs_pid_restart = @{}

	foreach ($proc in $procs) {
		if (-not $services_cache.ContainsKey($proc.pid)) {
			$service = & systemctl status $proc.pid | Select-Object -First 1
			$services_cache[$proc.pid] = $service
		}
		$service = $services_cache[$proc.pid]

		if (-not $pkgs_cache.ContainsKey($proc.file)) {
			$pkg = ""
			if (Test-Path '/usr/bin/dpkg') {
				$pkg = & dpkg -S $proc.file 2>&1
			} elseif (Test-Path '/usr/bin/rpm') {
				$pkg = & rpm -qf $proc.file 2>&1
			} else {
				throw "Failed to identify distribution specific packaging tool"
			}
			if (![string]::IsNullOrEmpty($pkg)) {
				$pkgs_cache[$proc.file] = $pkg.ToString().Trim()
			}
		}
		$pkg = $pkgs_cache[$proc.file]

		if ($service -match "\.service - ") {
			if (![string]::IsNullOrEmpty($pkg)) {
				if ($pkgs_service_restart.ContainsKey($pkg)) {
					$pkgs_service_restart[$pkg][$service] = $true
				} else {
					$pkgs_service_restart[$pkg] = @{$service = $true}
				}
			}
		} elseif ($service -match "\.scope - ") {
			if (![string]::IsNullOrEmpty($pkg)) {
				if ($pkgs_scope_restart.ContainsKey($pkg)) {
					$pkgs_scope_restart[$pkg][$service] = $true
				} else {
					$pkgs_scope_restart[$pkg] = @{$service = $true}
				}
			}
		} else {
			if (![string]::IsNullOrEmpty($pkg)) {
				if ($pkgs_pid_restart.ContainsKey($pkg)) {
					$pkgs_pid_restart[$pkg] += $proc
				} else {
					$pkgs_pid_restart[$pkg] = @($proc)
				}
			}
		}
	}

	# Print out the services to restart summary.
	foreach ($pkg in $pkgs_service_restart.Keys) {
		$services = $pkgs_service_restart[$pkg].Keys
		foreach ($service in $services) {
			[pscustomobject]@{
				Package  = $pkg
				Type     = "service"
				Identity = $($service -replace "● ", "")
				Action   = "restart"
			}
		}
	}

	# Print out the scopes to restart summary.
	foreach ($pkg in $pkgs_scope_restart.Keys) {
		$services = $pkgs_scope_restart[$pkg].Keys
		foreach ($service in $services) {
			[pscustomobject]@{
				Package  = $pkg
				Type     = "user"
				Identity = $($service -replace "● ", "")
				Action   = "log out and log in"
			}
		}
	}

	# Print out the PIDs to restart summary.
	foreach ($pkg in $pkgs_pid_restart.Keys) {
		$processes = $pkgs_pid_restart[$pkg]
		foreach ($proc in $processes) {
			[pscustomobject]@{
				Package  = $pkg
				Type     = "process"
				Identity = @{comm = $proc.comm; PID = $proc.pid; Owner = $proc.user}
				Action   = "restart"
			}
		}
	}
}