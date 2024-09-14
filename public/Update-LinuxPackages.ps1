function Update-LinuxPackages {
	<#
	.SYNOPSIS
		Update and upgrade Linux packages
	.DESCRIPTION
		Update and upgrade Linux packages
	.PARAMETER Type
		Valid values are "apt", "snap", "flatpak", or "all". Default is "all".
	.EXAMPLE
		Update-LinuxPackages

		Updates all packages
	.EXAMPLE
		Update-LinuxPackages -Type "apt"

		Updates only apt packages
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LinuxPackages.md
	#>
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$false)]
		[ValidateSet("apt","snap","flatpak","all")]
		[string]$Type = "all"
	)
	if ($Type -in ("apt","all")) {
		Update-AptPackages
	}
	if ($Type -in ("snap","all")) {
		Update-SnapPackages
	}
	if ($Type -in ("flatpak","all")) {
		Update-FlatpakPackages
	}
}