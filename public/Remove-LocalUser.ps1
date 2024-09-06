function Remove-LocalUser {
	<#
	.SYNOPSIS
		Remove a local user account
	.DESCRIPTION
		Remove a local user account
	.PARAMETER Name
		Name of the user to remove
	.EXAMPLE
		Remove-LocalUser -Name AdamMcchesney
	.EXAMPLE
		Remove-LocalUser -Name AdamMcchesne
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalUser.md
	#>
	[cmdletbinding(SupportsShouldProcess)]
	param (
		[Parameter(Mandatory=$true)][string]$Name
	)
	if (-not ($PSCmdlet.ShouldProcess("User:Delete:$Name"))) {
		return
	}
	sudo userdel -r $Name
}