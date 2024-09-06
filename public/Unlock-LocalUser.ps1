function Unlock-LocalUser {
	<#
	.SYNOPSIS
		Unlock a local user account
	.DESCRIPTION
		Unlock a local user account. Optionally set a new password.
	.PARAMETER Name
		Name of the user to unlock
	.PARAMETER Password
		Optional. Password to set for the user
	.EXAMPLE
		Unlock-LocalUser -Name "AdamMcchesney"
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Unlock-LocalUser.md
	#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)][string]$Name,
		[Parameter(Mandatory=$false)][string]$Password
	)
	if (Get-LocalUser -Name $Name) {
		if (![string]::IsNullOrWhiteSpace($Password)) {
			sudo usermod -p $Password $Name
		} else {
			sudo usermod -p $Name
		}
		sudo usermod -U $Name
	} else {
		Write-Error "User $Name not found."
	}
}