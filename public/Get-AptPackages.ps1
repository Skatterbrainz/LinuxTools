function Get-AptPackages {
	<#
	.SYNOPSIS
		Get a list of installed APT packages
	.DESCRIPTION
		Get a list of installed APT packages
	.PARAMETER (none)
		No parameters
	.EXAMPLE
		Get-AptPackages
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AptPackages.md
	#>
	[CmdletBinding()]
	param()
	try {
		if (-not (Test-Path -Path '/usr/bin/apt')) {
			throw "Required file not found: apt"
		}
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
