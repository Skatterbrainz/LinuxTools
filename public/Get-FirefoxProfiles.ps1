function Get-FireFoxProfiles {
	<#
	.SYNOPSIS
		Get Firefox profiles from profiles.ini file.
	.DESCRIPTION
		Get Firefox profiles from profiles.ini file. The function reads the profiles.ini file.
		Then it filters out the non-profile keys and expands the path to full name.
	.PARAMETER DefaultProfile
		Indicates to return the default profile.
	.EXAMPLE
		Get-FireFoxProfiles

		Get all Firefox profiles.
	.EXAMPLE
		Get-FireFoxProfiles -DefaultProfile

		Get the default Firefox profile.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-FireFoxProfiles.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][switch]$DefaultProfile
	)
	try {
		$basepath = "~/.mozilla/firefox"
		if (Test-Path -Path $basepath) {
			if (-not (Get-Command -Name Get-IniContent -ErrorAction SilentlyContinue)) {
				Import-Module -Name psIni -ErrorAction Stop
			}
			# expand path to full name
			$bpath = (Get-Item -Path $basepath).FullName
			$pfile = Join-Path $bpath "profiles.ini"
			if (Test-Path -Path $pfile) {
				$keysets = Get-IniContent -FilePath $pfile -ErrorAction Stop
				if ($keysets) {
					# filter out non-profile keys
					$pnames = $keysets.Keys | Where-Object {$_ -like "Profile*"}
					$profiles = @()
					foreach ($pname in $pnames) {
						# convert hashtable to object
						$pdata = [pscustomobject]$keysets[$pname]
						# fetch the profile path which contains "~" for home directory
						$tpath = $pdata.Path
						# expand the path to full name and update object
						$pdata.Path = Join-Path -Path $bpath -ChildPath $tpath
						# add object to array
						$profiles += $pdata
					}
				} else {
					throw "Unable to read: $pfile"
				}
			} else {
				throw "File not found: $pfile . Check 'about:profiles' in Firefox."
			}
		} else {
			throw "Path not found: $basepath"
		}
		if ($DefaultProfile.IsPresent) {
			$profiles | Where-Object { $_.Default -eq 1 }
		} else {
			$profiles
		}
	} catch {
		Write-Error -Message $_.Exception.Message
	}
}