function Get-MountedItems {
	<#
	.SYNOPSIS
		Get the mounted items on the system.
	.DESCRIPTION
		This function gets the mounted items on the system.
	.EXAMPLE
		Get-MountedItems
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-MountedItems.md
	#>
	[CmdletBinding()]
	param()
	try {
		$mountedItems = sudo cat /proc/mounts
		foreach ($item in $mountedItems) {
			$parts = $item -split '\s+'
			[PSCustomObject]@{
				Device     = $parts[0]
				MountPoint = $parts[1]
				Filesystem = $parts[2]
				MountFlags = $parts[3]
				DumpFreq   = $parts[4]
				CheckOrder = $parts[5]
			}
		}
	} catch {
		Write-Error "Failed to get mounted items: $($_.Exception.Message)"
	}
}