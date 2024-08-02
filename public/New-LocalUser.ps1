function New-LocalUser{
	<#
	.SYNOPSIS
		Creates a new local user account
	.DESCRIPTION
		Creates a new local user account
	.PARAMETER UserName
		Name of the user to create
	.EXAMPLE
		New-LocalUser adammcchesney
	.EXAMPLE
		New-LocalUser adammcchesney -WhatIf
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalUser.md
	#>
	[cmdletbinding(SupportsShouldProcess=$True)]
	param(
		[Parameter(Mandatory=$true)][string] $UserName,
		[Parameter()][switch] $DisabledPassword
	)
	if (-not ($PSCmdlet.ShouldProcess("User:Create:$UserName"))) {
		return
	}
	if ($DisabledPassword){
		$result = adduser $UserName --disabled-password
	}
	$result = adduser $UserName
	return  $result
}