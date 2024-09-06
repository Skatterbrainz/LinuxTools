function Add-LocalGroupMember {
	<#
	.SYNOPSIS
		Add a user to a local group
	.DESCRIPTION
		Add a user to a local security group
	.PARAMETER Name
		Name of the group to add the user to.
	.PARAMETER Member
		Name of the user to add to the group.
	.EXAMPLE
		Add-LocalGroupMember -Name "lpadmin" -Member "user42"
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Add-LocalGroupMember.md
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory)][string][ValidateNotNullOrEmpty()]$Name,
		[parameter(Mandatory)][string][ValidateNotNullOrEmpty()]$Member
	)
	if (-not (Get-LocalGroup -Name $Name)) {
		throw "Group does not exist: $Name"
	}
	if (-not (Get-LocalUser -Name $Member)) {
		throw "User does not exist: $Member"
	}
	$null = Invoke-Command -ScriptBlock { sudo usermod -aG $Name $Member }
}