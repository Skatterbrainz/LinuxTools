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
		$location = $Scope.ToLowerInvariant()
		$entries = @(ReadDesktopEntries -Location $location -Name $Name)
		if ($Contents) {
			$entries | ForEach-Object { Get-Content -Path $_.FullName }
		} else {
			$entries | Select-Object -Property BaseName, FullName -Unique | Sort-Object BaseName
		}
	} catch {
		Write-Error "Failed to get application launchers: $($_.Exception.Message)"
	}
}