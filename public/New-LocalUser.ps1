function New-LocalUser {
	<#
	.SYNOPSIS
		Create a new local user account
	.DESCRIPTION
		Create a new local user account
	.PARAMETER Name
		Name of the user to create
	.PARAMETER Description
		Description of the user
	.PARAMETER AccountExpires
		Optional. Date when the account expires
	.EXAMPLE
		New-LocalUser -Name "Fu Barr" -Description "The Fubar of Tarfu"
		New-LocalUser -Name "Fu Barr" -Description "The Fubar of Tarfu" -AccountExpires "2025-12-31"
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalUser.md
	#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)][string]$Name,
		[Parameter(Mandatory=$true)][string]$Description,
		[Parameter(Mandatory=$false)][string]$Password,
		[Parameter(Mandatory=$false)][string]$AccountExpires
	)
	sudo useradd --create-home --shell '/bin/bash' --comment "$Description" $Name
	sudo usermod -p $Password $Name
	Get-LocalUser -Name $Name
}