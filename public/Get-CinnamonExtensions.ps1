function Get-CinnamonExtensions {
	<#
	.SYNOPSIS
		Retrieves a list of installed Cinnamon extensions
	.DESCRIPTION
		Retrieves a list of installed Cinnamon extensions from the user's home directory
	.EXAMPLE
		Get-CinnamonExtensions
		Retrieves a list of installed Cinnamon extensions
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonExtensions.md
	#>
	[CmdletBinding()]
	param()
	if (-not (Test-Path -Path "~/.local/share/cinnamon/extensions")) {
		throw "Required path not found: ~/.local/share/cinnamon/extensions"
	}
	Get-ChildItem -Path "~/.local/share/cinnamon/extensions" -File -Filter "metadata.json" -Recurse | ForEach-Object {
		Get-Content -Path $_.FullName | ConvertFrom-Json }
}