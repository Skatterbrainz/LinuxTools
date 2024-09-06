function Get-LocalGroupMember {
	<#
	.SYNOPSIS
		Get local group members
	.DESCRIPTION
		Get local security group members
	.PARAMETER Name
		Name of the group to return members for
	.EXAMPLE
		Get-LocalGroupMember -Name "lpadmin"
		Returns a list of members in the "lpadmin" group on the local system.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LocalGroupMember.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory)][string][ValidateNotNullOrEmpty()]$Name
	)
	Get-LocalGroup -Name $Name | Select-Object -ExpandProperty Members
}