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
	param(
		[parameter(Mandatory=$false)][string]$Name,
		[parameter(Mandatory=$false)][string]$Filter = "*.desktop",
		[parameter(Mandatory=$false)][string]$Path = "$env:HOME/.config/autostart"
	)
	$autostart = Get-ChildItem -Path $Path -Filter $Filter -ErrorAction SilentlyContinue
	if ($autostart) {
		if (![string]::IsNullOrEmpty($Name)) {
			$desktop = $autostart | Where-Object { $_.Name -eq $Name } | Foreach-Object {Get-Content -Path $_.FullName -Raw}
		} else {
			$desktop = $autostart | Select-Object -ExpandProperty Name
		}
		$desktop
	} else {
		Write-Warning "No auto-start applications found"
	}
}