function Update-SnapPackages {
	<#
	.SYNOPSIS
		Update snap packages
	.DESCRIPTION
		Update snap packages
	.PARAMETER (none)
		No parameters
	.EXAMPLE
		Update-SnapPackages
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-SnapPackages.md
	#>
	param()
	try {
		write-host "Updating snap packages..."
		sudo snap refresh
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}
