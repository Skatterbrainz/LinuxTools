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
	.EXAMPLE
		Remove-LocalGroup -Name "mygroup"
		Removes the local security group named "mygroup"
	.EXAMPLE
		Remove-LocalGroup -Name "mygroup" -Force
		Removes the local security group named "mygroup" even if users have it as their primary group
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalGroup.md
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