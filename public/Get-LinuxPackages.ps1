function Get-LinuxPackages {
	<#
	.SYNOPSIS
		Get Linux packages
	.DESCRIPTION
		Get Linux packages and basic configuration settings
	.PARAMETER Type
		Valid values are "apt", "snap", "flatpak", "dnf" or "all". Default is "all".
	.PARAMETER Upgradable
		Only valid for "apt" type. If present, returns only upgradable packages.
	.EXAMPLE
		Get-LinuxPackages

		Returns all packages. Same as Get-LinuxPackages -Type "all"
	.EXAMPLE
		Get-LinuxPackages -Type "flatpak"

		Returns only flatpak packages
	.EXAMPLE
		Get-LinuxPackages -Type "apt" -Upgradable

		Returns only upgradable apt packages
	.EXAMPLE
		Get-LinuxPackages -Type "snap"

		Returns only snap packages
	.EXAMPLE
		Get-LinuxPackages -Type "dnf"

		Returns only dnf packages
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxPackages.md
	#>
	[CmdletBinding()]
	param (
		[parameter()][string][ValidateSet("apt","flatpak","snap","dnf","all")]$Type = "all",
		[parameter()][switch]$Upgradable
	)
	if ($Type -in ("apt","all")) {
		if ($Upgradable.IsPresent) {
			Get-AptPkgUpgradable
		} else {
			Get-AptPackages
		}
	}
	if ($Type -in ("flatpak","all")) {
		Get-FlatpakInventory
	}
	if ($Type -in ("snap","all")) {
		Get-SnapInventory
	}
	if ($Type -in ("dnf","all")) {
		Get-DnfPackages
	}
}