function Get-MemoryInfo {
	<#
	.SYNOPSIS
		Get memory information.
	.DESCRIPTION
		Get memory information.
	.EXAMPLE
		Get-MemoryInfo
		Get memory information.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-MemoryInfo.md
	#>
	[CmdletBinding()]
	param()
	$meminfo = Invoke-Command -ScriptBlock { sudo cat /proc/meminfo }
	$memdata = [System.Collections.Generic.List[object]]::new()
	foreach ($row in $meminfo) {
		$rowdata = @{
			Name  = $row.Split(':')[0].Trim()
			Value = $row.Split(':')[1].Trim()
		}
		$memdata.Add([PSCustomObject]$rowdata)
	}
	$memdata
}