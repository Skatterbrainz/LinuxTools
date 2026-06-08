function Get-DefaultAudioPlayer {
	<#
	.SYNOPSIS
		Get the default audio player.
	.DESCRIPTION
		Compatibility wrapper for Get-DefaultApplication -Category audio.
	.EXAMPLE
		Get-DefaultAudioPlayer
		Returns the default audio player.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-DefaultAudioPlayer.md
	#>
	[CmdletBinding()]
	param()
	$defaultAudio = ReadDefaultApplications -Category audio | Select-Object -First 1
	if ($defaultAudio) {
		$defaultAudio.DesktopEntry
	}
}