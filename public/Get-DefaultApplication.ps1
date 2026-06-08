function Get-DefaultApplication {
	<#
	.SYNOPSIS
		Gets default applications from mimeapps.list.
	.DESCRIPTION
		Reads ~/.config/mimeapps.list and returns default application mappings by category or MIME type.
	.PARAMETER Category
		Category to query. Valid values are browser, audio, video, image, text, or all.
	.PARAMETER MimeType
		Optional MIME type wildcard filter, for example "audio/*".
	.PARAMETER Path
		Optional path to a mimeapps.list file. Defaults to ~/.config/mimeapps.list.
	.EXAMPLE
		Get-DefaultApplication -Category browser
		Returns default browser mappings.
	.EXAMPLE
		Get-DefaultApplication -MimeType "audio/*"
		Returns audio MIME defaults.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultApplication.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][ValidateSet('browser','audio','video','image','text','all')][string]$Category = 'all',
		[parameter()][string]$MimeType,
		[parameter()][string]$Path = "$env:HOME/.config/mimeapps.list"
	)
	try {
		ReadDefaultApplications -Category $Category -MimeType $MimeType -Path $Path
	} catch {
		Write-Error $($_.Exception.Message -join(';'))
	}
}