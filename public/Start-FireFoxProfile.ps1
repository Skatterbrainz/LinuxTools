function Start-FireFoxProfile {
	<#
	.SYNOPSIS
		Starts a Firefox profile.
	.DESCRIPTION
		Starts a Firefox profile. If a profile name is not provided, the function will prompt for one.
	.PARAMETER ProfileName
		The name of the profile to start. If not provided, the function will prompt for one, unless
		the -DefaultProfile switch is used.
	.PARAMETER DefaultProfile
		Indicates to start the default profile.
	.EXAMPLE
		Start-FireFoxProfile

		Prompts user to select a profile from a list, and starts Firefox with the selected profile.
	.EXAMPLE
		Start-FireFoxProfile -ProfileName "Contoso"

		Starts Firefox with the profile named "Contoso".
	.EXAMPLE
		Start-FireFoxProfile -DefaultProfile

		Starts Firefox with the default profile.
	.NOTES
		To view, manage or create Firefox profiles, use the "about:profiles" URL in Firefox.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Start-FireFoxProfile.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False,HelpMessage="Profile name")][string]$ProfileName,
		[parameter(Mandatory=$false)][switch]$DefaultProfile
	)
	$ffprofiles = Get-FireFoxProfiles
	if ($DefaultProfile.IsPresent) {
		$ffprofile = $ffprofiles | Where-Object { $_.Default -eq 1 }
	} elseif (![string]::IsNullOrEmpty($ProfileName)) {
		$ffprofile = $ffprofiles | Where-Object { $_.Name -eq $ProfileName }
	} else {
		Write-Host "Select a Firefox profile to launch..." -ForegroundColor Yellow
		$ffprofile = getGridSelect -DataSet $ffprofiles -Title "Select Profile to Launch" -OutputMode Single
	}
	if ($ffprofile) {
		Start-Process -FilePath "firefox" -ArgumentList "-P $($ffprofile.Name) -no-remote"
	}
}