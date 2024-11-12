function Get-DiskInfo {
	<#
	.SYNOPSIS
		Get local disk information
	.DESCRIPTION
		Get local disk information using the "df" command.
	.PARAMETER FormatNumbers
		Return number values in units (e.g. 12GB, 1.2TB, etc.)
	.EXAMPLE
		Get-DiskInfo
		Enumerate all local disk information
	.EXAMPLE
		Get-DiskInfo -FormatNumbers
		Enumerate all local disk information with formatted numbers
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DiskInfo.md
	#>
	param(
		[switch]$FormatNumbers
	)
	# Invoke-Command -ScriptBlock { lsblk -o KNAME,UUID,MODEL,FSTYPE,SIZE,FSUSED,SERIAL,PTTYPE,MOUNTPOINT -P }
	# KNAME="sda" UUID="" MODEL="SAMSUNG SSD PM871b M.2 2280 512GB" FSTYPE="" SIZE="476.9G" FSUSED="" SERIAL="S3TZNB0K206736" PTTYPE="gpt" MOUNTPOINT=""
	if ($FormatNumbers.IsPresent) {
		$diskinfo = Invoke-Command { df --si } -ErrorAction Stop
	} else {
		$diskinfo = Invoke-Command { df } -ErrorAction Stop
	}
	$diskinfo[1..50] | ForEach-Object {
		$line = $_ -split "\s+"
		$pct = $line[4] # "28%"
		if ($pct -ne "0%") {
			$pct = $($pct -replace "%","") / 100
		} else {
			$pct = 0
		}
		[pscustomobject]@{
			"FileSystem"  = $line[0]
			"1KBlocks"    = $line[1]
			"Used"        = $line[2]
			"Available"   = $line[3]
			"UsedPercent" = $pct
			"MountPoint"  = $line[5]
		}
	}
}