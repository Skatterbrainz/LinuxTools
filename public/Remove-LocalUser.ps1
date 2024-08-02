function Remove-LocalUser {
	<#
	.SYNOPSIS
		Remove a local user account
	.DESCRIPTION
		Remove a local user account
	.PARAMETER UserName
		Name of the user to remove
	.EXAMPLE
		Remove-LocalUser -UserName AdamMcchesney
	.EXAMPLE
		Remove-LocalUser -UserName AdamMcchesne
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalUser.md
	#>
	[cmdletbinding(SupportsShouldProcess)]
	param (
		[Parameter(Mandatory=$true)][string] $UserName
	)
	if (-not ($PSCmdlet.ShouldProcess("User:Delete:$UserName"))) {
		return
	}
	return userdel -r $UserName
}