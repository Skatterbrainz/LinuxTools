function Remove-LocalUser {
	<#
	.SYNOPSIS
		Remove a local user account
	.DESCRIPTION
		Remove a local user account
	.PARAMETER Name
		Name of the user to remove
	.PARAMETER ShouldProcess
		Supports the ShouldProcess feature to confirm the action before executing it.
		Use this parameter to prevent accidental deletions.
	.EXAMPLE
		Remove-LocalUser -Name AdamMcchesney -WhatIf
		This example shows what would happen if the user "AdamMcchesney" were to be removed without actually executing the command.
	.EXAMPLE
		Remove-LocalUser -Name AdamMcchesney
	.EXAMPLE
		Remove-LocalUser -Name AdamMcchesne
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalUser.md
	.NOTES
		This function requires superuser privileges to remove a user account.
		Ensure that you have the necessary permissions to run this command.
		Use with caution, as it will permanently delete the user and their home directory if specified.
		Be sure to back up any important data before proceeding.
	#>
	[cmdletbinding(SupportsShouldProcess=$True)]
	param (
		[Parameter(Mandatory=$true)][string]$Name
	)
	if (-not ($PSCmdlet.ShouldProcess("User:Delete:$Name"))) {
		return
	}
	sudo userdel -r $Name
}