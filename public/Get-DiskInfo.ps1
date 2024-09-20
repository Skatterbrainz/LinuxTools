function Get-DiskInfo {
	param()
	<#
	.SYNOPSIS
		Get local disk information
	.DESCRIPTION
		Get local disk information using the "df" command.
	.PARAMETER (none)
		No parameters
	.EXAMPLE
		Get-DiskInfo
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DiskInfo.md
	#>
	# Invoke-Command -ScriptBlock { lsblk -o KNAME,UUID,MODEL,FSTYPE,SIZE,FSUSED,SERIAL,PTTYPE,MOUNTPOINT -P }
	# KNAME="sda" UUID="" MODEL="SAMSUNG SSD PM871b M.2 2280 512GB" FSTYPE="" SIZE="476.9G" FSUSED="" SERIAL="S3TZNB0K206736" PTTYPE="gpt" MOUNTPOINT=""
	$diskinfo = Invoke-Command { df } -ErrorAction Stop
	$diskinfo[1..50] | ForEach-Object {
		$line = $_ -split "\s+"
		[pscustomobject]@{
			"FileSystem"  = $line[0]
			"1KBlocks"    = $line[1]
			"Used"        = $line[2]
			"Available"   = $line[3]
			"UsedPercent" = $line[4]
			"MountPoint"  = $line[5]
		}
	}
}