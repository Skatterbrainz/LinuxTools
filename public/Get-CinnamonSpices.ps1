function Get-CinnamonSpices {
	<#
	.SYNOPSIS
		Retrieves a list of installed Cinnamon spices
	.DESCRIPTION
		Retrieves a list of installed Cinnamon spices from the user's home directory
	.PARAMETER Name
		Name of the spice to retrieve details for.
	.EXAMPLE
		Get-CinnamonSpices
		Retrieves a list of installed Cinnamon spices
	.EXAMPLE
		Get-CinnamonSpices -Name "Cinnamon-Spices-Applet"
		Retrieves details for the specified spice
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-CinnamonSpices.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][string]$Name
	)
	if ([string]::IsNullOrEmpty($Name)) {
		Get-ChildItem -Path "~/.config/cinnamon/spices" -Directory |
			Select-Object -Property Name, @{n='ShortName';e={$_.Name.Split('@')[0]}}, FullName
	} else {
		Get-ChildItem -Path '~/.config/cinnamon/spices' -Directory -Filter "$($Title)*" |
			Foreach-Object {
				$spiceName = $_.BaseName
				Get-ChildItem -Path $_.FullName -File -Filter '*.json' |
					ForEach-Object {
						$baseName = $_.BaseName
						Get-Content -Path $_.FullName | ConvertFrom-Json |
							Select-Object -Property *, @{n='Name';e={$spiceName}}, @{n='ShortName';e={$baseName}}
					}
			}
	}
}