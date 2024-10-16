function Get-MemoryConfiguration {
	<#
	.SYNOPSIS
		Get memory configuration.
	.DESCRIPTION
		Get memory configuration. This function uses dmidecode to get memory configuration.
	.EXAMPLE
		Get-MemoryConfiguration
		Get memory configuration for each bank on the current chassis.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-MemoryConfiguration.md
	#>
	param()
	try {
		$meminfo = Invoke-Command -ScriptBlock { sudo dmidecode -t memory }
		if ($meminfo) {
			$capacity  = $meminfo | Where-Object {$_ -match "Maximum Capacity"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			$slots     = $meminfo | Where-Object {$_ -match "Number Of Devices"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			$sticks    = $meminfo | Where-Object {$_.Trim() -match "Size"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			$units     = $sticks[0].split(' ')[1].Trim()
			$installed = "$(($sticks | Where-Object {$_ -ne "No Module Installed"} | ForEach-Object {$_.Split(' ')[0]} | Measure-Object -Sum).Sum) $units"
			$ffactor   = $meminfo | Where-Object {$_.Trim() -match "Form Factor"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			$mfr	   = $meminfo | Where-Object {$_.Trim() -match "Manufacturer"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			$type	   = $meminfo | Where-Object {$_.Trim() -match "^Type:"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			$sn        = $meminfo | Where-Object {$_.Trim() -match "Serial Number"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			$pn        = $meminfo | Where-Object {$_.Trim() -match "Part Number"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			$spd       = $meminfo | Where-Object {$_.Trim() -match "^Speed"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			$loc       = $meminfo | Where-Object {$_.Trim() -match "^Locator"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			$rank      = $meminfo | Where-Object {$_.Trim() -match "Rank"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			$bankloc   = $meminfo | Where-Object {$_.Trim() -match "Bank Locator"} | Foreach-Object { ($_ -split ":")[1].Trim() }
			#$result
			for ($i = 0; $i -lt $sticks.Count; $i++) {
				[pscustomobject]@{
					BankLocator     = $bankloc[$i]
					Capacity        = $sticks[$i]
					TotalInstalled  = $installed
					SystemCapacity  = $capacity
					FormFactor      = $ffactor[$i]
					Manufacturer    = $mfr[$i]
					Type            = $type[$i]
					SerialNumber    = $sn[$i]
					PartNumber      = $pn[$i]
					Speed           = $spd[$i]
					Locator         = $loc[$i]
					Rank            = $rank[$i]
					BankCapacity    = $slots
				}
			}
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}