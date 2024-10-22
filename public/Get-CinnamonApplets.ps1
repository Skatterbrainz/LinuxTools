function Get-CinnamonApplets {
	<#
	.SYNOPSIS
		Retrieves a list of installed Cinnamon applets
	.DESCRIPTION
		Retrieves a list of installed Cinnamon applets from the user's home directory
	.EXAMPLE
		Get-CinnamonApplets
		Retrieves a list of installed Cinnamon applets
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonApplets.md
	#>
	[CmdletBinding()]
	param()
	Get-ChildItem -Path "~/.local/share/cinnamon/applets" -File -Filter "metadata.json" -Recurse | ForEach-Object {
		Get-Content -Path $_.FullName | ConvertFrom-Json }
}