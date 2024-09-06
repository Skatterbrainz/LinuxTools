function Get-DefaultBrowser {
	<#
	.SYNOPSIS
		Get the default browser.
	.DESCRIPTION
		This function reads the ~/.config/mimeapps.list file to determine the default browser.
	.PARAMETER browser
		The default browser. If not provided, the function will attempt to determine it.
	.EXAMPLE
		Get-DefaultBrowser
		Returns the default browser.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultBrowser.md
	#>
	param()
	$mimeApps = Get-Content -Path "$env:HOME/.config/mimeapps.list" -Raw
	$browser = $null
	if ($mimeApps -match "x-scheme-handler/https=(.*)") {
		$browser = $matches[1]
	}
	return $browser
}