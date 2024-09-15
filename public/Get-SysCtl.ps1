function Get-SysCtl {
	<#
	.SYNOPSIS
		Get the value of sysctl parameters.
	.DESCRIPTION
		Get the value of sysctl parameters, or for a specified parameter.
	.PARAMETER Name
		The name of the sysctl parameter to get. If not specified, all parameters are returned.
	.EXAMPLE
		Get-SysCtl

		Get all sysctl parameters.
	.EXAMPLE
		Get-SysCtl -Name vm.swappiness

		Get the value of the vm.swappiness sysctl parameter.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SysCtl.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$false)][string]$Name
	)
	$params = Invoke-Command -ScriptBlock { sudo sysctl -a }
	$result = [System.Collections.Generic.List[object]]::new()
	$params | Foreach-Object {
		$row = $_.Split('=')
		$null = $result.Add(([PSCustomObject]@{
			Name  = $row[0].Trim()
			Value = $row[1].Trim()
		}))
	}
	if (![string]::IsNullOrEmpty($Name)) {
		$result | Where-Object { $_.Name -eq $Name }
	} else {
		$result
	}
}