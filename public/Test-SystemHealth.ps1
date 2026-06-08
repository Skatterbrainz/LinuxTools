function Test-SystemHealth {
	<#
	.SYNOPSIS
		Runs a consolidated Linux system health check.
	.DESCRIPTION
		Collects health indicators from disk, memory, failed services, package updates, and reboot state.
	.PARAMETER WarningDiskPercent
		Disk usage threshold considered warning level.
	.PARAMETER WarningMemoryPressure
		Memory pressure threshold considered warning level.
	.EXAMPLE
		Test-SystemHealth
		Returns a health summary for the local system.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Test-SystemHealth.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][int]$WarningDiskPercent = 85,
		[parameter()][int]$WarningMemoryPressure = 60
	)
	try {
		$warnings = @()
		$checks = [ordered]@{}

		$diskRows = df -P | Select-Object -Skip 1
		$maxDiskUse = 0
		foreach ($row in $diskRows) {
			$parts = $row.Split(' ') | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
			if ($parts.Count -ge 6) {
				$usePct = [int](($parts[4]).TrimEnd('%'))
				if ($usePct -gt $maxDiskUse) { $maxDiskUse = $usePct }
			}
		}
		$checks['MaxDiskPercent'] = $maxDiskUse
		if ($maxDiskUse -ge $WarningDiskPercent) {
			$warnings += "Disk usage warning: $maxDiskUse%"
		}

		$memoryPressure = 0
		if (Test-Path '/proc/pressure/memory') {
			$pressureLine = Get-Content '/proc/pressure/memory' | Where-Object { $_ -like 'some *' } | Select-Object -First 1
			if ($pressureLine -match 'avg10=(?<avg10>[0-9.]+)') {
				$memoryPressure = [math]::Round([double]$matches['avg10'], 2)
			}
		}
		$checks['MemoryPressureAvg10'] = $memoryPressure
		if ($memoryPressure -ge $WarningMemoryPressure) {
			$warnings += "Memory pressure warning: avg10=$memoryPressure"
		}

		$failedServiceCount = 0
		if (Get-Command -Name systemctl -ErrorAction SilentlyContinue) {
			$failedServices = systemctl --failed --no-legend 2>$null | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
			$failedServiceCount = @($failedServices).Count
		}
		$checks['FailedServices'] = $failedServiceCount
		if ($failedServiceCount -gt 0) {
			$warnings += "Failed services: $failedServiceCount"
		}

		$pendingUpdates = 0
		if (Get-Command -Name Get-PackageUpdates -ErrorAction SilentlyContinue) {
			$pendingUpdates = @(Get-PackageUpdates).Count
		}
		$checks['PendingUpdates'] = $pendingUpdates
		if ($pendingUpdates -gt 0) {
			$warnings += "Pending package updates: $pendingUpdates"
		}

		$rebootPending = $false
		if (Get-Command -Name Test-RebootPending -ErrorAction SilentlyContinue) {
			$rebootValue = Test-RebootPending
			$rebootPending = [bool]$rebootValue
		}
		$checks['RebootPending'] = $rebootPending
		if ($rebootPending) {
			$warnings += 'Reboot pending'
		}

		$score = 100
		$score -= ($warnings.Count * 15)
		if ($score -lt 0) { $score = 0 }

		$status = if ($warnings.Count -eq 0) { 'Healthy' } elseif ($warnings.Count -le 2) { 'Warning' } else { 'Critical' }
		$checksObject = [pscustomobject]$checks

		[pscustomobject]@{
			HealthScore         = $score
			Status              = $status
			MaxDiskPercent      = $maxDiskUse
			MemoryPressureAvg10 = $memoryPressure
			FailedServices      = $failedServiceCount
			PendingUpdates      = $pendingUpdates
			RebootPending       = $rebootPending
			WarningCount        = $warnings.Count
			Warnings            = $warnings
			Checks              = $checksObject
		}
	} catch {
		Write-Error $($_.Exception.Message -join(';'))
	}
}