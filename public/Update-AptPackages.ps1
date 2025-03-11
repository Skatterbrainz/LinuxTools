function Update-AptPackages {
	<#
	.SYNOPSIS
		Update and upgrade APT packages
	.DESCRIPTION
		Update and upgrade APT packages
	.PARAMETER (none)
		No parameters
	.EXAMPLE
		Update-AptPackages
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-AptPackages.md
	#>
	param()
	try {
		write-host "Updating apt cache..."
		sudo apt update
		write-host "Upgrading packages..."
		sudo apt upgrade -y
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}
