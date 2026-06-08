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
	.NOTES
		dnf is a package manager for RPM-based distributions, such as Fedora and CentOS.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DnfPackages.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][string]$Name
	)
	try {
		$pkgs = ReadDnfPackageData
		if ([string]::IsNullOrWhiteSpace($Name)) {
			$pkgs
		} else {
			$pkgs | Where-Object { $_.Name -like "*$Name*" }
		}
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}