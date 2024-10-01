function Test-RebootPending {
	<#
	.SYNOPSIS
		Test if a reboot is pending.
	.DESCRIPTION
		Test if a reboot is pending. This function checks for a reboot-required file on Debian-based systems.
	.EXAMPLE
		Test-RebootPending
		Returns True if a reboot is pending.
	.NOTES
		This is a work in progress - more to come.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Test-RebootPending.md
	#>
	[CmdletBinding()]
	param()
	if ($CheckServices.IsPresent) {
		$bscript = $(Split-Path $PSScriptRoot -Parent) + "/bash/needs-restart.pl"
		if (Test-Path $bscript) {
			$rebootPending = Invoke-Command -ScriptBlock { sudo $bscript } -ErrorAction Stop
		} else {
			Write-Warning "Script not found: $bscript"
		}
	} else {
		if ((Get-LinuxDistro) -match "Debian") {
			Write-Verbose "Debian platform detected"
			Test-Path "/var/run/reboot-required"
		}
	}
}