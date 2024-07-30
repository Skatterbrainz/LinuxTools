function Remove-LxLocalUser {
	<#
	.SYNOPSIS
		Remove a local user account
	.DESCRIPTION
		Remove a local user account
	.PARAMETER UserName
		Name of the user to remove
	.EXAMPLE
		PS C:\> Remove-User -UserName AdamMcchesney
	.EXAMPLE
		PS C:\> Remove-User -UserName AdamMcchesne
	.INPUTS
		System.String.UserName The username for the user to be deleted.
	.OUTPUTS
		System.String. The Remove-User returns the output of userdel command
	.NOTES
		General notes
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