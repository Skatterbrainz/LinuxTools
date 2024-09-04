function Get-ComputerInfo {
	<#
	.SYNOPSIS
		Get basic computer and operating system info
	.DESCRIPTION
		Get basic computer system and operating system information, including
		processor, make and model, OS name and version, kernel version, and so on.
	.PARAMETER NeoFetch
		Optional. Use the NeoFetch command to display system information.
	.EXAMPLE
		Get-ComputerInfo
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ComputerInfo.md
	#>
	param (
		[parameter()][switch]$NeoFetch
	)
	if ($PSBoundParameters['NeoFetch']) {
		Invoke-Command -ScriptBlock { neofetch }
		return
	} else {
		$results = [ordered]@{}
		$name = Invoke-Command -ScriptBlock { hostname }
		$results['ComputerName'] = $name
		$arch = Invoke-Command -ScriptBlock { uname -p }
		$results['Architecture'] = $arch
		$kern = Invoke-Command -ScriptBlock { uname -r }
		$results['Kernel'] = $kern
		$hw = Invoke-Command -ScriptBlock { sudo dmidecode | grep -A3 '^System Information' } | Foreach-Object {$_.Trim()}
		foreach ($item in $hw) {
			if ($item.Contains(':')) {
				$parts = $item.Split(":") | ForEach-Object {$_.Trim()}
				$results[$parts[0].Replace(' ','_').Replace('(','').Replace(')','')] = $parts[1]
			}
		}
		$sn = sudo dmidecode -t system | grep Serial
		if (![string]::IsNullOrEmpty($sn)) {
			$sn = $sn.Split(':')[1].Trim()
		} else {
			$sn = "N/A"
		}
		$results['SerialNumber'] = $sn
		$cpu = Invoke-Command -ScriptBlock { lscpu }
		foreach ($item in $cpu) {
			if ($item.Contains(':')) {
				$parts = $item.Split(":") | Foreach-Object {$_.Trim()}
				$results[$parts[0].Replace(' ','_').Replace('(','').Replace(')','')] = $parts[1]
			}
		}
		$lastboot = Invoke-Command -ScriptBlock { last } | Where-Object {$_.StartsWith('reboot')} | Select-Object -First 1
		$lastboot = $lastboot.Substring(43,12) # just "Feb 22 13:45" portion
		$lastbootdate = (Get-Date $lastboot.Substring(0,6) -f 'MM/dd/yyyy') # convert "Feb 22" first
		$lastboottime = (Get-Date "$($lastbootdate) $($lastboot.Substring(7,5))") # join date and string before converting again
		$results['LastBoot'] = (Get-Date $lastboottime)
		$uptime = Invoke-Command -ScriptBlock { uptime -p } # "up 5 days, 8 hours, 13 minutes"
		$results['Uptime'] = $uptime.Substring(3)
		[pscustomobject]$results
	}
}