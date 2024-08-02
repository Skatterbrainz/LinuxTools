function Update-AllPackages {
	<#
	.SYNOPSIS
		Update all packages	
	.DESCRIPTION
		Update all packages
	.PARAMETER (none)
		No parameters
	.EXAMPLE
		Update-AllPackages
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-AllPackages.md
	#>
	param()
	try {
		Update-AptPackages
		Update-FlatpakPackages
		Update-SnapPackages
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}