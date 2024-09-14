# add helper functions here

function Get-AptPkgInventory {
	<#
	.SYNOPSIS
		Get a list of installed APT packages
	.DESCRIPTION
		Get a list of installed APT packages
	.PARAMETER (none)
		No parameters
	.EXAMPLE
		Get-AptPkgInventory
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AptPkgInventory.md
	#>
	[CmdletBinding()]
	param()
	try {
		write-host "Updating apt cache..."
		sudo apt update
		$apps = sudo apt list
		$apps | ForEach-Object {
			$tpkg = $null
			$tpkg = $_.Split("[")
			$pkg  = $tpkg[0].Split(" ")
			$stat = $tpkg[1]
			if (![string]::IsNullOrEmpty($stat)) {
				$stat   = $stat.TrimEnd("]")
				$latest = $stat.Replace("upgradable from: ", "")
			}
			[pscustomobject]@{
				Name            = $pkg[0]
				Current         = $pkg[1]
				Rev             = $pkg[2]
				Available       = $latest
			}
		}
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}
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
		$flatpaks = flatpak list --columns=name,version,application,description,installation,size
		$flatpaks | ForEach-Object {
			$pkg = $_.Split("`t") | Where-Object {![string]::IsNullOrEmpty($_)}
			[pscustomobject]@{
				Name            = $pkg[0]
				Version         = $pkg[1]
				AppId           = $pkg[2]
				Description     = $pkg[3]
				InstallLocation = $pkg[4]
				Size            = $pkg[5]
			}
		}
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}

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
		write-host "Listing snaps..."
		$snaps = snap list --all
		$snaps | ForEach-Object {
			$pkg = $_.Split(" ") | Where-Object {![string]::IsNullOrEmpty($_)}
			[pscustomobject]@{
				Name            = $pkg[0]
				Version         = $pkg[1]
				Rev             = $pkg[2]
				Tracking        = $pkg[3]
				Publisher       = $pkg[4]
				Notes           = $pkg[5]
			}
		}
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}

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

function Get-AptPkgUpgradable {
	<#
	.SYNOPSIS
		Collects inventory of upgradable apt packages.
	.DESCRIPTION
		Collects inventory of upgradable apt packages.
	.PARAMETER (none)
		No parameters
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AptPkgUpgradable.md
	#>
	param()
	try {
		write-host "Updating apt cache..."
		sudo apt update
		$apps = sudo apt list --upgradable
		$apps | ForEach-Object {
			$tpkg = $null
			$tpkg = $_.Split("[")
			$pkg  = $tpkg[0].Split(" ")
			$stat = $tpkg[1]
			if (![string]::IsNullOrEmpty($stat)) {
				$stat = $stat.TrimEnd("]")
				$latest = $stat.Replace("upgradable from: ", "")
			}
			[pscustomobject]@{
				Name            = $pkg[0]
				Current         = $pkg[1]
				Rev             = $pkg[2]
				Available       = $latest
			}
		}
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}
