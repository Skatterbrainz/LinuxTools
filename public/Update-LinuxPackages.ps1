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
		[ValidateSet("apt","snap","flatpak","dnf","all")]
		[string]$Type = "all"
	)
	if ($Type -in ("apt","all")) {
		if ($Type -eq 'apt' -or (TestLinuxPackageManager -Type 'apt')) {
			InvokeLinuxPackageUpdate -Type 'apt'
		}
	}
	if ($Type -in ("snap","all")) {
		if ($Type -eq 'snap' -or (TestLinuxPackageManager -Type 'snap')) {
			InvokeLinuxPackageUpdate -Type 'snap'
		}
	}
	if ($Type -in ("flatpak","all")) {
		if ($Type -eq 'flatpak' -or (TestLinuxPackageManager -Type 'flatpak')) {
			InvokeLinuxPackageUpdate -Type 'flatpak'
		}
	}
	if ($Type -in ("dnf","all")) {
		if ($Type -eq 'dnf' -or (TestLinuxPackageManager -Type 'dnf')) {
			InvokeLinuxPackageUpdate -Type 'dnf'
		}
	}
}