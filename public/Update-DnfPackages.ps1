function Update-DnfPackages {
	<#
	.SYNOPSIS
		Update DNF packages
	.DESCRIPTION
		Update DNF packages on a Linux system using the dnf package manager.
	.EXAMPLE
		Update-DnfPackages
		Updates all installed DNF packages to their latest versions.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-DnfPackages.md
	.NOTES
		This function requires the dnf package manager to be installed on the system.
		Ensure that you have the necessary permissions to run this command, as it may require superuser privileges.
	#>
	[CmdletBinding()]
	param()
	try {
		if (!(Test-Path -Path '/usr/bin/dnf')) {
			throw "File not found: dnf"
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
		Write-Error $_.Exception.Message
	}
}