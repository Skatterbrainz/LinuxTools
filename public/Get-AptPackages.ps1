function Get-AptPackages {
	<#
	.SYNOPSIS
		Get a list of installed APT packages
	.DESCRIPTION
		Get a list of installed APT packages
	.PARAMETER Upgradeable
		Whether to list only upgradable packages
	.EXAMPLE
		Get-AptPackages
		Lists all installed APT packages
	.EXAMPLE
		Get-AptPackages -Upgradeable
		Lists only upgradable APT packages
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AptPackages.md
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory=$false)][switch]$Upgradeable
	)
	try {
		if (-not (Test-Path -Path '/usr/bin/apt')) {
			throw "Required file not found: apt"
		}
		write-host "Updating apt cache..."
		sudo apt update
		if ($Upgradeable) {
			$apps = sudo apt list --upgradable
		} else {
			$apps = sudo apt list
		}

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
