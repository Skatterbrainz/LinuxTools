function Get-PackageUpdates {
	<#
	.SYNOPSIS
		Gets pending package updates without installing them.
	.DESCRIPTION
		Queries supported package managers for available updates and returns structured objects.
	.PARAMETER Type
		Valid values are "apt", "snap", "flatpak", "dnf" or "all". Default is "all".
	.PARAMETER Summary
		If present, returns one row per package manager with the pending update count.
	.EXAMPLE
		Get-PackageUpdates
		Returns pending updates from all available package managers.
	.EXAMPLE
		Get-PackageUpdates -Type apt
		Returns pending APT updates.
	.EXAMPLE
		Get-PackageUpdates -Summary
		Returns a summarized update count by package manager.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-PackageUpdates.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][ValidateSet('apt','flatpak','snap','dnf','all')][string]$Type = 'all',
		[parameter()][switch]$Summary
	)
	try {
		$updates = @(ReadLinuxPackageUpdates -Type $Type)
		if ($Summary) {
			$selectedTypes = if ($Type -eq 'all') {
				'apt','flatpak','snap','dnf' | Where-Object { TestLinuxPackageManager -Type $_ }
			} else {
				@($Type)
			}
			foreach ($manager in $selectedTypes) {
				$managerUpdates = @($updates | Where-Object { $_.SourceType -eq $manager })
				[pscustomobject]@{
					SourceType   = $manager
					UpdateCount  = $managerUpdates.Count
					HasUpdates   = $managerUpdates.Count -gt 0
				}
			}
		} else {
			$updates
		}
	} catch {
		Write-Error $($_.Exception.Message -join(';'))
	}
}