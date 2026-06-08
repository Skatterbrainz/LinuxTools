function Get-DesktopEntries {
	<#
	.SYNOPSIS
		Gets desktop entry files from user, system, or autostart locations.
	.DESCRIPTION
		Queries .desktop entry files and returns metadata with optional file contents.
	.PARAMETER Location
		Location scope to query. Valid values are User, System, AutoStart, or All.
	.PARAMETER Name
		Optional name filter for desktop entries.
	.PARAMETER Contents
		If present, includes each matching desktop file content.
	.PARAMETER Path
		Optional path override, only used when Location is AutoStart.
	.PARAMETER Filter
		File filter pattern. Default is *.desktop.
	.EXAMPLE
		Get-DesktopEntries -Location User
		Returns user desktop entries.
	.EXAMPLE
		Get-DesktopEntries -Location AutoStart -Name firefox -Contents
		Returns matching autostart entry content.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DesktopEntries.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][ValidateSet('User','System','AutoStart','All')][string]$Location = 'User',
		[parameter()][string]$Name,
		[parameter()][switch]$Contents,
		[parameter()][string]$Path,
		[parameter()][string]$Filter = '*.desktop'
	)
	try {
		ReadDesktopEntries -Location $Location.ToLowerInvariant() -Name $Name -Contents:$Contents -Path $Path -Filter $Filter
	} catch {
		Write-Error $($_.Exception.Message -join(';'))
	}
}