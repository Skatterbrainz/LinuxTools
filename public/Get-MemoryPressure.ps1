function Get-MemoryPressure {
	<#
	.SYNOPSIS
		Get the current memory pressure.
	.DESCRIPTION
		Get the current memory pressure.
	.EXAMPLE
		Get-MemoryPressure
		Get the current memory pressure.
	#>
	[CmdletBinding()]
	param()
	$pressure = Invoke-Command -ScriptBlock { sudo cat /sys/fs/cgroup/system.slice/memory.pressure }
	foreach ($row in $pressure) {
		$rowdata = @{
			Type = $row.Split(' ')[0]
		}
		$row.Split(' ')[1..4] | ForEach-Object {
			$rowdata.Add($_.Split('=')[0], $_.Split('=')[1])
		}
		[PSCustomObject]$rowdata
	}
}