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
		if (-not (Test-Path -Path '/usr/bin/apt')) {
			throw "Required file not found: apt"
		}
		if (Test-Path -Path '/usr/bin/nala') {
			write-host "Using Nala for package management..."
			sudo nala update
			sudo nala upgrade -y
		} else {
			write-host "Using APT for package management..."
			apt update
			apt upgrade -y
		}
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}
