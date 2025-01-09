function Update-LocalGroup {
	<#
	.SYNOPSIS
		Update a local group
	.DESCRIPTION
		Update a local security group with new settings
	.PARAMETER Name
		Name of the group to update
	.PARAMETER NewName
		Optional. New name for the group
	.PARAMETER GroupID
		Optional. New group ID
	.EXAMPLE
		Update-LocalGroup -Name "mygroup" -NewName "mynewgroup"
		Updates the local group named "mygroup" with the new name "mynewgroup"
	.EXAMPLE
		Update-LocalGroup -Name "mygroup" -GroupID 1001
		Updates the local group named "mygroup" with the group ID 1001
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LocalGroup.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true)][string]$Name,
		[parameter(Mandatory=$false)][string]$NewName,
		[parameter(Mandatory=$false)][int32]$GroupID
	)
	try {
		if (Get-LocalGroup -Name $Name) {
			$basecmd = "sudo groupmod"
			if (![string]::IsNullOrEmpty($NewName)) {
				$basecmd += " --new-name $NewName"
			}
			if ($GroupID) {
				$basecmd += " --gid $GroupID"
			}
			$basecmd += " $Name"
			Write-Verbose $basecmd
			Invoke-Expression $basecmd
			Get-LocalGroup -Name $Name
		} else {
			throw "Group '$Name' not found"
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}