function Update-FlatpakPackages {
	<#
	.SYNOPSIS
		Update and upgrade Flatpak packages
	.DESCRIPTION
		Update and upgrade Flatpak packages
	.PARAMETER (none)
		No parameters
	.EXAMPLE
		Update-FlatpakPackages
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-FlatpakPackages.md
	#>
	param()
	try {
		write-host "Updating flatpak packages..."
		flatpak update -y
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}