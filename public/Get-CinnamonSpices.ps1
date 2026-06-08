function Get-CinnamonSpices {
	<#
	.SYNOPSIS
		Retrieves a list of installed Cinnamon spices
	.DESCRIPTION
		Retrieves installed Cinnamon spices, or queries Cinnamon applets and extensions through a unified interface.
	.PARAMETER Type
		Component type to return. Valid values are "spices", "applets", "extensions" or "all".
	.PARAMETER Name
		Name of the spice to retrieve details for.
	.EXAMPLE
		Get-CinnamonSpices
		Retrieves a list of installed Cinnamon spices
	.EXAMPLE
		Get-CinnamonSpices -Type applets
		Retrieves installed Cinnamon applets
	.EXAMPLE
		Get-CinnamonSpices -Name "Cinnamon-Spices-Applet"
		Retrieves details for the specified spice
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonSpices.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][ValidateSet('spices','applets','extensions','all')][string]$Type = 'spices',
		[parameter()][string]$Name
	)
	ReadAllCinnamonComponents -Type $Type -Name $Name
}