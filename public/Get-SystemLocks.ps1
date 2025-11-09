function Get-SystemLocks {
	<#
	.SYNOPSIS
		Get system locks
	.DESCRIPTION
		Get system locks using lslocks
	.PARAMETER name
		The name of the command associated with the lock to filter by
	.EXAMPLE
		Get-SystemLocks
		Returns current system locks
	.EXAMPLE
		Get-SystemLocks -Name "lockname"
		Returns locks matching the specified name
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SystemLocks.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$false)][string]$Name
	)
	try {
		if (!(Test-Path -Path '/usr/bin/lslocks')) {
			throw "File not found: lslocks"
		}
		$result = lslocks --json | ConvertFrom-Json | Select-Object -ExpandProperty locks
		if (![string]::IsNullOrEmpty($Name)) {
			$result = $result | Where-Object { $_.command -like "*$Name*" }
		}
	} catch {
		Write-Error $_.Exception.Message
	} finally {
		Write-Host "Total locks found: $($result.Count)" -ForegroundColor Green
		Write-Output $result
	}
}