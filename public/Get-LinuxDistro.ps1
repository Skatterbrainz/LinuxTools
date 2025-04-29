function Get-LinuxDistro {
	<#
	.SYNOPSIS
		Get the Linux distribution name.
	.DESCRIPTION
		This function reads the /etc/os-release file to determine the Linux distribution name.
	.PARAMETER distro
		The Linux distribution name. If not provided, the function will attempt to determine it.
	.PARAMETER Detailed
		Include PSVersionTable OS value with output. This is appended following a semi-colon
	.EXAMPLE
		Get-LinuxDistro
		Returns the Linux distribution name.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxDistro.md
	#>
	param (
		[parameter()][string]$distro = "",
		[parameter()][switch]$Detailed
	)
	if (Test-Path "/etc/os-release") {
		$osRelease = Get-Content -Path "/etc/os-release" -Raw	
		# Check for Debian-based distributions
		if ($osRelease -match "debian|ubuntu") {
			$distro = "Debian/Ubuntu"
		}
		# Check for Fedora-based distributions
		elseif ($osRelease -match "fedora") {
			$distro = "Fedora"
		}
		# Check for Red Hat-based distributions
		elseif ($osRelease -match "redhat") {
			$distro = "Red Hat"
		}
		if (![string]::IsNullOrEmpty($distro)) {
			if ($Detailed.IsPresent) {
				$distro += "; $($PSVersionTable.OS)"
			}
		}
	}
	return $distro
}
