function Get-DesktopThemes {
	<#
	.SYNOPSIS
		Retrieves a list of installed desktop themes
	.DESCRIPTION
		Retrieves a list of installed desktop themes from the user's home directory
	.EXAMPLE
		Get-DesktopThemes
		Retrieves a list of installed desktop themes
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DesktopThemes.md
	#>
	param()
	Get-ChildItem -Path "~/.themes" -File -Filter "info.json" -Recurse | ForEach-Object {
		Get-Content -Path $_.FullName | ConvertFrom-Json
	}
}