function Get-CinnamonVersion {
	<#
	.SYNOPSIS
		Get the version of the installed Cinnamon desktop
	.DESCRIPTION
		Get the version of the installed Cinnamon desktop
	#>
	param()
	if (IsCinnamonInstalled -eq $true) {
		Invoke-Command -ScriptBlock { sudo cinnamon --version }
	} else {
		Write-Warning "Cinnamon desktop is not installed"
	}
}
