function Remove-LocalGroupMember {
	<#
	.SYNOPSIS
		Remove a user from a local group
	.DESCRIPTION
		Remove a user from a local security group
	.PARAMETER Name
		Name of the group to remove the user from.
	.PARAMETER Member
		Name of the user to remove from the group.
	.EXAMPLE
		Remove-LocalGroupMember -Name "lpadmin" -Member "user42"
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Remove-LocalGroupMember.md
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
	if ($Member -in (Get-LocalGroupMember -Name $Name)) {
		$null = Invoke-Command -ScriptBlock { sudo usermod -rG $Name $Member }
	} else {
		Write-Warning "User $Member is not a member of group $Name"
	}
}