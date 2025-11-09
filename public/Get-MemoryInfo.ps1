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
	try {
		if (!(Test-Path -Path '/proc/meminfo')) {
			throw "File not found: /proc/meminfo"
		}
		$meminfo = Invoke-Command -ScriptBlock { sudo cat /proc/meminfo }
		$result = @{}
		foreach ($row in $meminfo) {
			$name  = Get-NullString -String $row.Split(':')[0]
			$value = Get-NullString -String $row.Split(':')[1]
			$result[$name] = $value
		}
		[pscustomobject]$result
	} catch {
		Write-Error $_.Exception.Message
	}
}