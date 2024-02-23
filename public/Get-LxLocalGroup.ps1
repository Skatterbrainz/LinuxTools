<#
.SYNOPSIS
Get local groups

.DESCRIPTION
Get local security groups

.PARAMETER Identity
Optional. Name of group to return. Default is to return all groups.

.EXAMPLE
Get-LxLocalGroup

.EXAMPLE
Get-LxLocalGroup -Identity "music.lovers"

.LINK
https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LxLocalGroup.md
#>
function Get-LxLocalGroup {
	param (
		[parameter()][string]$Identity
	)
	try {
		$groups = Invoke-Command -ScriptBlock { cat /etc/group }
		$computer = Invoke-Command -ScriptBlock { hostname }
		$results = [System.Collections.ArrayList]::new()
		foreach ($group in $groups) {
			$gdata = $group.Split(":")
			$row = [pscustomobject]@{
				Name     = $gdata[0]
				ID       = $gdata[2]
				Members  = $gdata[3].Split(",")
				Computer = $computer
			}
			$null = $results.Add($row)
		}
		if (![string]::IsNullOrWhiteSpace($Identity)) {
			$results | Where-Object {$_.Name -eq $Identity}
		} else {
			$results | Sort-Object Id,Name
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}