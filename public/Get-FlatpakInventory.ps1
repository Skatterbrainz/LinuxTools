function Get-FlatpakInventory {
	<#
	.SYNOPSIS
		Collects inventory of installed flatpak packages.
	.DESCRIPTION
		Collects inventory of installed flatpak packages.
	.PARAMETER (none)
		No parameters
	.EXAMPLE
		Get-FlatpakInventory
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-FlatpakInventory.md
	#>
	param()
	try {
		ReadFlatpakPackageData
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}
