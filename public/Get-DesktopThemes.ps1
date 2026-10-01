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
	# if Cinnamon or GNOME, themes are typically stored in ~/.themes
	if (Test-Path -Path "~/.themes") {
		Get-ChildItem -Path "~/.themes" -File -Filter "info.json" -Recurse | ForEach-Object {
			Get-Content -Path $_.FullName | ConvertFrom-Json
		}
	} elseif (Test-Path -Path "~/.local/share") {
		$themes = Get-ChildItem -Path "~/.local/share" "*.desktop" -Recurse
		# check for KDE themes, but where does KDE store global themes?
		# KDE themes metadata is typically stored in "metadata.desktop" files
		# Fetch the properties from the metadata.desktop files, example:
		# [Desktop Entry]
		# Name=Andromeda
		# X-KDE-PluginInfo-Author=eliverlara
		# X-KDE-PluginInfo-Category=
		# X-KDE-PluginInfo-Depends=
		# X-KDE-PluginInfo-Email=eliverlara@gmail.com
		# X-KDE-PluginInfo-EnabledByDefault=true
		# X-KDE-PluginInfo-License=GPLv3
		# X-KDE-PluginInfo-Name=Andromeda
		# X-KDE-PluginInfo-Version=1.0.0
		foreach ($theme in $themes) {
			# Process each theme file here if needed
			$themePath = $theme.FullName
			$themeContent = Get-Content -Path $themePath
			$themeInfo = @{}
			foreach ($line in $themeContent) {
				if ($line -match '^Name=(.+)$' -or $line -match '^X-KDE-PluginInfo-Author=(.+)$' -or $line -match '^X-KDE-PluginInfo-Category=(.+)$' -or $line -match '^X-KDE-PluginInfo-Depends=(.+)$' -or $line -match '^X-KDE-PluginInfo-Email=(.+)$' -or $line -match '^X-KDE-PluginInfo-EnabledByDefault=(.+)$' -or $line -match '^X-KDE-PluginInfo-License=(.+)$' -or $line -match '^X-KDE-PluginInfo-Name=(.+)$' -or $line -match '^X-KDE-PluginInfo-Version=(.+)$') {
					#$matches
				}
				# You can store the matched information in the $themeInfo hashtable if needed
				$themeInfo[$matches[0]] = $matches[1]
			}
			# You can output the theme information if needed
			[PSCustomObject]$themeInfo
		}
	} else {
		Write-Warning "No theme directories found."
	}
}