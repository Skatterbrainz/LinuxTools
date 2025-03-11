function Get-AutoStartApps {
	<#
	.SYNOPSIS
		Get a list of applications set to auto-start on login
	.DESCRIPTION
		Get a list of applications set to auto-start on login
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
		[parameter()][string]$Name
	)
	$autostart = Get-ChildItem -Path "$env:HOME/.config/autostart" -Filter "*.desktop" -ErrorAction SilentlyContinue
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