function Get-DnfPackages {
	<#
	.SYNOPSIS
		Get DNF packages
	.DESCRIPTION
		Get DNF packages and basic configuration settings
	.PARAMETER Name
		Package name to search for. If not specified, all packages are returned.
	.EXAMPLE
		Get-DnfPackages
		Returns all DNF packages
	.EXAMPLE
		Get-DnfPackages -Name "vim"
		Returns only the vim package
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DnfPackages.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][string]$Name
	)
	try {
		if (-not (Test-Path -Path '/usr/bin/dnf')) {
			throw "Required file not found: dnf"
		}
		#write-host "Updating dnf cache..."
		$rawdata = dnf list --installed
		$rawdata[1..$($rawdata.length-1)] | ForEach-Object {
			$_.Split(' ') | Where-Object {![string]::IsNullOrWhiteSpace($_)}
		}
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}