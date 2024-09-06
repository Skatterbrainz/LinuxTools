function Get-DefaultAudioPlayer {
	<#
	.SYNOPSIS
		Get the default audio player.
	.DESCRIPTION
		This function reads the ~/.config/mimeapps.list file to determine the default audio player.
	.PARAMETER audioPlayer
		The default audio player. If not provided, the function will attempt to determine it.
	.EXAMPLE
		Get-DefaultAudioPlayer
		Returns the default audio player.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultAudioPlayer.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][string]$audioPlayer = ""
	)
	$mimeApps = Get-Content -Path "$env:HOME/.config/mimeapps.list" -Raw
	$audioPlayer = $null
	if ($mimeApps -match "audio/(.*)") {
		$audioPlayer = $matches[1]
	} elseif ($mimeApps -match "audio/x-(.*)") {
		$audioPlayer = $matches[1]
	} elseif ($mimeApps -match "audio/mp3") {
		$audioPlayer = $matches[1]
	} elseif ($mimeApps -match "audio/mp4") {
		$audioPlayer = $matches[1]
	}
	return $audioPlayer
}