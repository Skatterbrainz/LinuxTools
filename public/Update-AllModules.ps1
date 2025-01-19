function Update-AllModules {
	<#
	.SYNOPSIS
		Check installed modules against the PSGallery and update if requested
	.DESCRIPTION
		Check installed modules against the PSGallery and update if requested
	.PARAMETER Update
		Perform the update. Otherwise, just report on the status
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-AllModules.md
	#>
	[CmdletBinding()]
	param (
		[parameter()][switch]$Update
	)
	# get all installed modules returning only the latest version of each
	$moduleNames = Get-InstalledPSResource | Where-Object {$_.Repository -eq 'PSGallery'} | Sort-Object Name | Select-Object -Unique -Property Name
	$moduleNames = $moduleNames | Where-Object {$_.Name -notin ('Az')}
	foreach ($module in $moduleNames) {
		$moduleName    = $module.Name
		$moduleVersion = $null
		$mstate        = $null
		Write-Verbose "Checking module $moduleName"
		$m = Get-Module -Name $moduleName -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1
		$moduleVersion = $m.Version
		write-verbose "Installed version***: $($moduleVersion)"
		$gallery       = $null
		$gallery       = Find-PSResource -Name $moduleName -ErrorAction SilentlyContinue
		if ($gallery) {
			Write-Verbose "Found module $moduleName in gallery"
			$galleryVersion = $gallery.Version
			if ([version]$moduleVersion -ge [version]$galleryVersion) {
				$mstate = "Current"
			} else {
				if ($Update.IsPresent) {
					Write-Verbose "Updating module $moduleName"
					Update-PSResource -Name $moduleName
					$mstate = "Updated"
				} else {
					$mstate = "Outdated"
				}
			}
		} else {
			Write-Verbose "Module $moduleName not found in gallery"
			$mstate = "Local"
			$galleryVersion = [version]'0.0.0'
		}
		write-verbose "Module $moduleName is $mstate"
		Write-Verbose "Installed version: $moduleVersion"
		Write-Verbose "Gallery version: $galleryVersion"
		write-verbose "state: $mstate"
		[pscustomobject]@{
			Name      = $moduleName
			Installed = $moduleVersion
			Available = $galleryVersion.ToString()
			State     = $mstate
		}
	}
}