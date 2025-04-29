function Get-SystemInfo {
	<#
	.SYNOPSIS
		Gets detailed system information from a Linux system.
	.DESCRIPTION
		Collects information about CPU, memory, disk, and operating system.
	.EXAMPLE
		Get-SystemInfo
	#>
	[CmdletBinding()]
	param()

	$osInfo   = lsb_release -a 2>/dev/null | Out-String
	$cpuInfo  = cat /proc/cpuinfo | Select-String "model name" | Select-Object -First 1
	$memInfo  = free -h | Out-String
	$diskInfo = df -h | Out-String
	
	# Check if this is Linux Mint and get Ubuntu base version
	$isLinuxMint = $osInfo -match "Linux Mint"
	$ubuntuBaseVersion = $null
	if ($isLinuxMint) {
		if (Test-Path "/etc/upstream-release/lsb-release") {
			$ubuntuBaseVersion = Get-Content "/etc/upstream-release/lsb-release" | 
								 Select-String "DISTRIB_DESCRIPTION" | 
								 ForEach-Object { $_ -replace 'DISTRIB_DESCRIPTION="|"', '' }
		}
	}

	[PSCustomObject]@{
		OperatingSystem = $osInfo
		CPU = ($cpuInfo -split ':')[-1].Trim()
		Memory = $memInfo
		DiskSpace = $diskInfo
		UbuntuBaseVersion = if ($isLinuxMint) { $ubuntuBaseVersion } else { $null }
	}
}