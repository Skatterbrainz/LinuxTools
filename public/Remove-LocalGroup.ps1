function Remove-LocalGroup {
	<#
	.SYNOPSIS
		Remove a local security group
	.DESCRIPTION
		Remove a local security group
	.PARAMETER Name
		Name of the group to remove
	.PARAMETER Force
		Forces the removal of the group even if users have it as their primary group.
	.PARAMETER ShouldProcess
		Supports the ShouldProcess feature to confirm the action before executing it.
		Use this parameter to prevent accidental deletions.
	.EXAMPLE
		Remove-LocalGroup -Name "mygroup"
		Removes the local security group named "mygroup"
	.EXAMPLE
		Remove-LocalGroup -Name "mygroup" -Force
		Removes the local security group named "mygroup" even if users have it as their primary group
	.EXAMPLE
		Remove-LocalGroup -Name "mygroup" -WhatIf
		This example shows what would happen if the group "mygroup" were to be removed without actually executing the command.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalGroup.md
	.NOTES
		This function requires superuser privileges to remove a group.
		Ensure that you have the necessary permissions to run this command.
		Use with caution, as it will permanently delete the group and its members.
		Be sure to back up any important data before proceeding.
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param (
		[Parameter(Mandatory=$true)][string]$Name,
		[Parameter(Mandatory=$false)][switch]$Force
	)
	if (-not ($PSCmdlet.ShouldProcess("User:Delete:$Name"))) {
		return
	}
	if ($Force) {
		sudo groupdel --force $Name
	} else {
		sudo groupdel $Name
	}
}