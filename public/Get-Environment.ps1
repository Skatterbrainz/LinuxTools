function Get-Environment {
	<#
	.SYNOPSIS
		Get system environment variables
	.DESCRIPTION
		Returns system environment variables
	.PARAMETER Name
		Optional. Name of environment variable. Default is to return all variables.
	.EXAMPLE
		Get-Environment
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-Environment.md
	#>
	param(
		[parameter()][string]$Name
	)
	$results = [System.Collections.ArrayList]::new()
	$items = Invoke-Command -ScriptBlock { cat /etc/environment }
	foreach ($item in $items) {
		$parts = $item.Split("=")
		$key   = $parts[0]
		$val   = $parts[1].Split(":")
		$null  = $results.Add(([pscustomobject]@{
			Name  = $key
			Value = if ($val.Count -gt 1) { $val } else { $val[0] }
		}))
	}
	if (![string]::IsNullOrWhiteSpace($Name)) {
		$results | Where-Object {$_.Name -eq $Name}
	} else {
		$results
	}
}