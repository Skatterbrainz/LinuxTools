function New-LocalGroup {
	<#
	.SYNOPSIS
		Create a new local group
	.DESCRIPTION
		Create a new local security group
	.PARAMETER Name
		Name of the group to create
	.EXAMPLE
		New-LocalGroup -Name "mygroup"
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalGroup.md
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory)][string][ValidateNotNullOrEmpty()]$Name
	)
	if (Get-LocalGroup -Name $Name) {
		throw "Group already exists: $Name"
	} else {
		$null = Invoke-Command -ScriptBlock { sudo groupadd $Name }
		Get-LocalGroup -Name $Name	
	}
}