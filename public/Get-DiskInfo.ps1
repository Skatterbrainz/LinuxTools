function Get-DiskInfo {
	param()
	<#
	.SYNOPSIS
		Get local disk information
	.DESCRIPTION
		Get local disk information
	.PARAMETER (none)
		No parameters
	.EXAMPLE
		Get-DiskInfo
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DiskInfo.md
	#>
	$items = Invoke-Command -ScriptBlock { lsblk -o KNAME,UUID,MODEL,FSTYPE,SIZE,FSUSED,SERIAL,PTTYPE,MOUNTPOINT -P }
	$items # more work to do here
	# KNAME="sda" UUID="" MODEL="SAMSUNG SSD PM871b M.2 2280 512GB" FSTYPE="" SIZE="476.9G" FSUSED="" SERIAL="S3TZNB0K206736" PTTYPE="gpt" MOUNTPOINT=""

}