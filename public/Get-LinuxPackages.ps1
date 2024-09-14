function Get-LinuxPackages {
	<#
	.SYNOPSIS
		Get Linux packages
	.DESCRIPTION
		Get Linux packages and basic configuration settings
	.PARAMETER Type
		Valid values are "apt", "snap", "flatpak", or "all". Default is "all".
	.PARAMETER Upgradable
		Only valid for "apt" type. If present, returns only upgradable packages.
	.EXAMPLE
		Get-LinuxPackages

		Returns all packages
	.EXAMPLE
		Get-LinuxPackages -Type "flatpak"

		Returns only flatpak packages
	.EXAMPLE
		Get-LinuxPackages -Type "apt" -Upgradable

		Returns only upgradable apt packages
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxPackages.md
	#>
	[CmdletBinding()]
	param (
		[parameter()][string][ValidateSet("apt","flatpak","snap","all")]$Type = "all",
		[parameter()][switch]$Upgradable
	)
	if ($Type -in ("apt","all")) {
		if ($Upgradable.IsPresent) {
			Get-AptPkgUpgradable
		} else {
			Get-AptPkgInventory
		}
	}
	if ($Type -in ("flatpak","all")) {
		Get-FlatpakInventory
	}
	if ($Type -in ("snap","all")) {
		Get-SnapInventory
	}
}