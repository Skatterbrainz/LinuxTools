function Get-AppLaunchers {
	<#
	.SYNOPSIS
		Get the application launchers on the system.
	.DESCRIPTION
		This function gets the application launchers on the system.
	.PARAMETER Scope
		The scope of the application launchers to get. The default is "User".
	.PARAMETER Name
		The name of the application launcher to get. If not specified, all application launchers are returned.
	.PARAMETER Contents
		If Name is provided, this returns the contents of the matching application launchers.
	.EXAMPLE
		Get-AppLaunchers

		Get all application launchers on the system for the current user.
	.EXAMPLE
		Get-AppLaunchers -Scope System

		Get all application launchers on the system for all users.
	.EXAMPLE
		Get-AppLaunchers -Name Firefox

		Get the application launcher for Firefox for the current user.
	.EXAMPLE
		Get-AppLaunchers -Name Firefox -Contents

		Get the contents of the application launcher for Firefox for the current user.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AppLaunchers.md
	#>
	[CmdletBinding()]
	param (
		[parameter()][string][ValidateSet("User","System")]$Scope = "User",
		[parameter()][string]$Name,
		[parameter()][switch]$Contents
	)
	try {
		$UserPath = "~/.local/share/applications"
		$SystemPath = "/usr/share/applications"
		$AppPath = if ($Scope -eq "User") { $UserPath } else { $SystemPath }
		if (!(Test-Path -Path $AppPath)) {
			throw "Path not found: $AppPath"
		}
		$launchers = Get-ChildItem -Path $AppPath -Filter "*.desktop" -File -ErrorAction Stop
		if (![string]::IsNullOrEmpty($Name)) {
			if ($Contents.IsPresent) {
				$launchers | Where-Object { $_.BaseName -like "*$Name*" } | ForEach-Object { Get-Content -Path $_.FullName }
			} else {
				$launchers | Where-Object { $_.BaseName -like "*$Name*" } | Select-Object -Property BaseName, FullName -Unique
			}
		} else {
			$launchers | Select-Object -Property BaseName, FullName | Sort-Object BaseName -Unique
		}
	} catch {
		Write-Error "Failed to get application launchers: $($_.Exception.Message)"
	}
}