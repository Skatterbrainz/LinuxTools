function Get-LocalGroup {
	<#
	.SYNOPSIS
		Get local groups
	.DESCRIPTION
		Get local security groups
	.PARAMETER Name
		Optional. Name of group to return. Default is to return all groups.
	.EXAMPLE
		Get-LocalGroup

		Returns a list of all local groups on the system in tabular format.
	.EXAMPLE
		Get-LocalGroup -Name "lpadmin"

		Returns details for the "lpadmin" group on the local system in tabular format.

		Name    ID  Members  Computer
		----    --  -------  --------
		lpadmin 105 {user42} mint22
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LocalGroup.md
	#>
	param (
		[parameter()][string]$Name
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
		if (![string]::IsNullOrWhiteSpace($Name)) {
			$results | Where-Object {$_.Name -eq $Name}
		} else {
			$results | Sort-Object Id,Name
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}