function Get-GPUInfo {
	<#
	.SYNOPSIS
		Gets GPU adapter and driver information.
	.DESCRIPTION
		Returns GPU adapter data from lspci and, when available, NVIDIA runtime details.
	.EXAMPLE
		Get-GPUInfo
		Returns GPU adapter and driver information.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-GPUInfo.md
	#>
	[CmdletBinding()]
	param()
	try {
		$adapters = @()
		if (Get-Command -Name lspci -ErrorAction SilentlyContinue) {
			$lspciRows = lspci | Where-Object { $_ -match 'VGA|3D controller|Display controller' }
			foreach ($row in $lspciRows) {
				if ($row -match '^(?<Bus>[0-9a-fA-F:.]+)\s+(?<Class>.+?):\s+(?<Model>.+)$') {
					$adapters += [pscustomobject]@{
						BusAddress = $matches['Bus']
						Class      = $matches['Class']
						Model      = $matches['Model']
					}
				}
			}
		}

		$nvidia = $null
		if (Get-Command -Name nvidia-smi -ErrorAction SilentlyContinue) {
			$nvidia = nvidia-smi --query-gpu=name,driver_version,memory.total,memory.used,temperature.gpu --format=csv,noheader 2>$null |
				ForEach-Object {
					$parts = $_.Split(',') | ForEach-Object { $_.Trim() }
					if ($parts.Count -ge 5) {
						[pscustomobject]@{
							Name          = $parts[0]
							DriverVersion = $parts[1]
							MemoryTotal   = $parts[2]
							MemoryUsed    = $parts[3]
							Temperature   = $parts[4]
						}
					}
				}
		}
		[pscustomobject]@{
			Adapters = $adapters
			Nvidia   = $nvidia
		}
	} catch {
		Write-Error $($_.Exception.Message -join(';'))
	}
}