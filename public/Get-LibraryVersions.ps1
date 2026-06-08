function Get-LibraryVersions {
	<#
	.SYNOPSIS
		Gets versions of common system libraries.
	.DESCRIPTION
		Returns installed versions for common runtime libraries such as libc and OpenSSL-related packages.
	.EXAMPLE
		Get-LibraryVersions
		Returns common system library versions.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LibraryVersions.md
	#>
	[CmdletBinding()]
	param()
	try {
		$targets = @('libc6','libssl3','libssl1.1','libcrypto3','libstdc++6','zlib1g')
		if (Get-Command -Name dpkg-query -ErrorAction SilentlyContinue) {
			foreach ($pkg in $targets) {
				$version = dpkg-query -W -f='${Version}' $pkg 2>$null
				if (-not [string]::IsNullOrWhiteSpace($version)) {
					[pscustomobject]@{
						Name    = $pkg
						Version = $version.Trim()
						Source  = 'dpkg'
					}
				}
			}
		} elseif (Get-Command -Name rpm -ErrorAction SilentlyContinue) {
			$rpmTargets = @('glibc','openssl-libs','libstdc++','zlib')
			foreach ($pkg in $rpmTargets) {
				$version = rpm -q --queryformat '%{VERSION}-%{RELEASE}' $pkg 2>$null
				if ($LASTEXITCODE -eq 0 -and -not [string]::IsNullOrWhiteSpace($version)) {
					[pscustomobject]@{
						Name    = $pkg
						Version = $version.Trim()
						Source  = 'rpm'
					}
				}
			}
		} else {
			Write-Warning 'No supported package query tool found (dpkg-query or rpm)'
		}
	} catch {
		Write-Error $($_.Exception.Message -join(';'))
	}
}