function Get-SnapInventory {
	<#
	.SYNOPSIS
		Collects inventory of installed snap packages.
	.DESCRIPTION
		Collects inventory of installed snap packages.
	.PARAMETER (none)
		No parameters
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SnapInventory.md
	#>
	param()
	try {
		ReadSnapPackageData
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}
