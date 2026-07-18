function Get-MemoryPressure {
	<#
	.SYNOPSIS
		Get the current memory pressure.
	.DESCRIPTION
		Get the current memory pressure.
	.EXAMPLE
		Get-MemoryPressure
		Get the current memory pressure.
	.NOTES
		The Rating property is derived from the avg10 value (10-second average pressure percentage):
		0 = no pressure (avg10 = 0)
		1 = minimal pressure (avg10 > 0 and <= 20)
		2 = low pressure    (avg10 > 20 and <= 40)
		3 = moderate pressure (avg10 > 40 and <= 60)
		4 = high pressure   (avg10 > 60 and <= 80)
		5 = critical pressure (avg10 > 80)
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-MemoryPressure.md
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
		$avg10Value = [double]$rowdata['avg10']
		$rowdata['Rating'] = if ($avg10Value -eq 0) { 0 }
			elseif ($avg10Value -le 20) { 1 }
			elseif ($avg10Value -le 40) { 2 }
			elseif ($avg10Value -le 60) { 3 }
			elseif ($avg10Value -le 80) { 4 }
			else { 5 }
		[PSCustomObject]$rowdata
	}
}