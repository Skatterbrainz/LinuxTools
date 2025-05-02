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
		if (Test-Path -Path '/usr/bin/dnf') {
			$pkgs = dnf list --installed
			foreach ($row in $pkgs[1..$($pkgs.Count-1)]) {
				$items = $row.Split(' ') | Where-Object {![string]::IsNullOrWhiteSpace($_)}
				[pscustomobject]@{
					Name    = $items[0]
					Version = $items[1]
					Source  = $items[2]
				}
			}
		}
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}