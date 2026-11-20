function Get-YumPackages {
	<#
	.SYNOPSIS
		Get yum packages
	.DESCRIPTION
		Get yum packages and basic configuration settings
	.PARAMETER Name
		Package name to search for. If not specified, all packages are returned.
	.EXAMPLE
		Get-YumPackages

		Returns all yum packages
	.EXAMPLE
		Get-YumPackages -Name "vim"
		
		Returns only the vim package
	.NOTES
		yum is a package manager for RPM-based distributions, such as RHEL and CentOS.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-YumPackages.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][string]$Name
	)
	try {
		$pkgs = ReadYumPackageData
		if ([string]::IsNullOrWhiteSpace($Name)) {
			$pkgs
		} else {
			$pkgs | Where-Object { $_.Name -like "*$Name*" }
		}
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}