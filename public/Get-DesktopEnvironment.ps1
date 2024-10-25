function Get-DesktopEnvironment {
	<#
	.SYNOPSIS
		Get the current desktop environment.
	.DESCRIPTION
		Get the current desktop environment.
	.EXAMPLE
		Get-DesktopEnvironment
		Returns the name of the current desktop environment. Example: cinnamon
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DesktopEnvironment.md
	#>
	[CmdletBinding()]
	param()
	$result = @{}
	$result['DesktopSession'] = $env:DESKTOP_SESSION
	if ($result['DesktopSession'] -eq "cinnamon") {
		$result['Version'] = $env:CINNAMON_VERSION
	} elseif ($result['DesktopSession'] -eq "plasma") {
		$result['Version'] = $env:KDU_SESSION_VERSION
	}
	if ($env:GDM_LANG) {
		$result['GdmLang'] = $env:GDM_LANG
	}
	if ($env:GNOME_DESKTOP_SESSION_ID) {
		$result['GnomeDesktopSessionId'] = $env:GNOME_DESKTOP_SESSION_ID
	}
	if ($env:WAYLAND_DISPLAY) {
		$result['WaylandDisplay'] = $env:WAYLAND_DISPLAY
	}
	[pscustomobject]$result
}