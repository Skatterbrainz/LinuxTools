function New-LocalGroup {
	<#
	.SYNOPSIS
		Create a new local group
	.DESCRIPTION
		Create a new local security group
	.PARAMETER Name
		Name of the group to create
	.PARAMETER GroupID
		Optional. Group ID
	.EXAMPLE
		New-LocalGroup -Name "mygroup"
		Creates a new local group named "mygroup"
	.EXAMPLE
		New-LocalGroup -Name "mygroup" -GroupID 1001
		Creates a new local group named "mygroup" with the group ID 1001
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalGroup.md
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory)][string][ValidateNotNullOrEmpty()]$Name,
		[parameter(Mandatory)][int32]$GroupID
	)
	try {
		if (Get-LocalGroup -Name $Name) {
			throw "Group '$Name' already exists"
		}
		$basecmd = "sudo groupadd"
		if ($GroupID) {
			$basecmd += " --gid $GroupID"
		}
		$basecmd += " $Name"
		Write-Verbose $basecmd
		Invoke-Expression $basecmd
		Get-LocalGroup -Name $Name
	} catch {
		Write-Error $_.Exception.Message
	}
}