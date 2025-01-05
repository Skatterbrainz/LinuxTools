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

function Get-GridSelect {
	<#
	.SYNOPSIS
		Display a grid view of the specified data set and return the selected item(s)
	.DESCRIPTION
		Display a grid view of the specified data set and return the selected item(s)
	.PARAMETER DataSet
		Specify the data set (array, arraylist, collection) to display in the grid view
	.PARAMETER Title
		Specify the title of the grid view window
	.PARAMETER OutputMode
		Specify the output mode: Single or Multiple. Default is Multiple
	.EXAMPLE
		Get-GridSelect -DataSet $users -Title "Select a User Account" -OutputMode Single
		Display a grid view of the specified data set and return the selected item
	.EXAMPLE
		Get-GridSelect -DataSet $users -Title "Select User Accounts"
		Display a grid view of the specified data set and return the selected item(s)
	#>
	param (
		[parameter(Mandatory=$True)]$DataSet,
		[parameter(Mandatory=$True)][string]$Title,
		[parameter(Mandatory=$False)][string][ValidateSet('Single','Multiple')]$OutputMode = 'Multiple'
	)
	if (Get-Module Microsoft.PowerShell.ConsoleGuiTools -ListAvailable) {
		@($DataSet | Out-ConsoleGridView -Title $Title -OutputMode $OutputMode)
	} else {
		Write-Warning "Linux platforms require module: microsoft.powershell.consoleguitools"
	}
}

function IsCinnamonInstalled {
	<#
	.SYNOPSIS
		Determine if Cinnamon desktop is installed
	.DESCRIPTION
		Determine if Cinnamon desktop is installed
	#>
	param()
	$desktop = Get-ChildItem -Path "/usr/share/xsessions" -Filter "cinnamon.desktop" -ErrorAction SilentlyContinue
	if ($desktop) {
		Write-Output $true
		$global:IsCinnamon = $true
	} else {
		Write-Output $false
		$global:IsCinnamon = $false
	}
}

function Get-CinnamonVersion {
	<#
	.SYNOPSIS
		Get the version of the installed Cinnamon desktop
	.DESCRIPTION
		Get the version of the installed Cinnamon desktop
	#>
	param()
	if ($IsCinnamon) {
		try {$cver = Invoke-Command -ScriptBlock { cinnamon --version }} catch {}
		$cver
	} else {
		Write-Warning "Cinnamon desktop is not installed"
	}
}

function Get-LogFile {
    param()
    Get-Content -Path $global:LogFilePath -ErrorAction SilentlyContinue
}
