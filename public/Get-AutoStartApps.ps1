function Get-AutoStartApps {
	<#
	.SYNOPSIS
		Get a list of applications set to auto-start on login
	.DESCRIPTION
		Get a list of applications set to auto-start on login
	.PARAMETER Name
		The name of the desktop file to retrieve (e.g., "firefox.desktop")
	.PARAMETER Filter
		The file filter to identify desktop files (default: *.desktop)
	.PARAMETER Path
		The path to the autostart directory (default: $env:HOME/.config/autostart)
	.EXAMPLE
		Get-AutoStartApps
		Returns a list of applications set to auto-start on login
	.EXAMPLE
		Get-AutoStartApps -Name "firefox.desktop"
		Returns the desktop file for the specified application
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AutoStartApps.md
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory=$false)][string]$Name,
		[parameter(Mandatory=$false)][string]$Filter = "*.desktop",
		[parameter(Mandatory=$false)][string]$Path = "$env:HOME/.config/autostart"
	)
	$autostart = @(ReadDesktopEntries -Location autostart -Name $Name -Filter $Filter -Path $Path -Contents:([bool]$Name))
	if (-not $autostart) {
		Write-Warning "No auto-start applications found"
		return
	}
	if (![string]::IsNullOrEmpty($Name)) {
		$autostart | Select-Object -ExpandProperty Content
	} else {
		$autostart | Select-Object -ExpandProperty Name
	}
}