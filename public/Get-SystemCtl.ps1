function Get-SystemCtl {
	<#
	.SYNOPSIS
		Get-SystemCtl retrieves systemctl information
	.DESCRIPTION
		Get-SystemCtl retrieves systemctl information
	.EXAMPLE
		Get-SystemCtl
		Get-SystemCtl retrieves systemctl information
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SystemCtl.md
	#>
	param()
	$systemctl = Get-Command systemctl -ErrorAction SilentlyContinue
	if ($systemctl) {
		$result = [ordered]@{}
		$response = Invoke-Command -ScriptBlock {systemctl show} | Where-Object {$_ -match '='}
		foreach ($row in $response) {
			$pair = $row.Split('=')
			$result.Add($pair[0], $pair[1])
		}
		[pscustomobject]$result
	} else {
		Write-Warning "systemctl command not found"
	}
}