function Get-DefaultBrowser {
	<#
	.SYNOPSIS
		Get the default browser.
	.DESCRIPTION
		Compatibility wrapper for Get-DefaultApplication -Category browser.
	.EXAMPLE
		Get-DefaultBrowser
		Returns the default browser.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultBrowser.md
	#>
	[CmdletBinding()]
	param()
	$defaultBrowser = ReadDefaultApplications -Category browser |
		Where-Object { $_.MimeType -in @('x-scheme-handler/https','x-scheme-handler/http') } |
		Select-Object -First 1
	if ($defaultBrowser) {
		$defaultBrowser.DesktopEntry
	}
}