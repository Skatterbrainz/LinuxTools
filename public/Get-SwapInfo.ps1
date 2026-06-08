function Get-SwapInfo {
	<#
	.SYNOPSIS
		Gets Linux swap configuration and usage.
	.DESCRIPTION
		Returns swap devices/files, size, usage, and vm.swappiness.
	.EXAMPLE
		Get-SwapInfo
		Returns swap usage and swappiness settings.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SwapInfo.md
	#>
	[CmdletBinding()]
	param()
	try {
		$swapRows = @()
		if (Test-Path -Path '/proc/swaps') {
			$lines = Get-Content -Path '/proc/swaps' | Select-Object -Skip 1
			foreach ($line in $lines) {
				$parts = $line.Split(' ') | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
				if ($parts.Count -ge 5) {
					$sizeKb = [double]$parts[2]
					$usedKb = [double]$parts[3]
					$swapRows += [pscustomobject]@{
						Name        = $parts[0]
						Type        = $parts[1]
						SizeKB      = [int64]$sizeKb
						UsedKB      = [int64]$usedKb
						Priority    = [int]$parts[4]
						SizeGB      = [math]::Round($sizeKb / 1MB, 2)
						UsedGB      = [math]::Round($usedKb / 1MB, 2)
						UsedPercent = if ($sizeKb -gt 0) { [math]::Round(($usedKb / $sizeKb) * 100, 2) } else { 0 }
					}
				}
			}
		}
		$swappinessRaw = (sysctl -n vm.swappiness 2>$null)
		$swappiness = if ([string]::IsNullOrWhiteSpace($swappinessRaw)) { $null } else { [int]$swappinessRaw }
		[pscustomobject]@{
			Swappiness = $swappiness
			SwapCount  = $swapRows.Count
			SwapItems  = $swapRows
		}
	} catch {
		Write-Error $($_.Exception.Message -join(';'))
	}
}