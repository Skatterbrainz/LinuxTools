function Get-AptPackages {
	<#
	.SYNOPSIS
		Get a list of installed APT packages
	.DESCRIPTION
		Get a list of installed APT packages
	.PARAMETER Upgradeable
		Whether to list only upgradable packages
	.EXAMPLE
		Get-AptPackages
		Lists all installed APT packages
	.EXAMPLE
		Get-AptPackages -Upgradeable
		Lists only upgradable APT packages
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AptPackages.md
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory=$false)][switch]$Upgradeable
	)
	try {
		ReadAptPackageData -Upgradable:$Upgradeable
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}
