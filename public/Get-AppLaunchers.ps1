function Get-AppLaunchers {
	<#
	.SYNOPSIS
		Get the application launchers on the system.
	.DESCRIPTION
		This function gets the application launchers on the system.
	.EXAMPLE
		Get-AppLaunchers
	.LINK
	#>
	[CmdletBinding()]
	param (
		[parameter()][string][ValidateSet("User","System")]$Scope = "User"
	)
	try {
		$UserPath = "~/.local/share/applications"
		$SystemPath = "/usr/share/applications"
		$AppPath = if ($Scope -eq "User") { $UserPath } else { $SystemPath }
		if (!(Test-Path -Path $AppPath)) {
			throw "Path not found: $AppPath"
		}
		$launchers = Get-ChildItem -Path $AppPath -Filter "*.desktop" -Recurse -ErrorAction Stop
		foreach ($launcher in $launchers) {
			[pscustomobject]$(Get-IniContent -FilePath $launcher.FullName).Values
		}
	} catch {
		Write-Error "Failed to get application launchers: $($_.Exception.Message)"
	}
}