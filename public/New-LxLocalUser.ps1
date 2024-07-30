function New-LxLocalUser{
	<#
	.SYNOPSIS
		Creates a new local user account
	.DESCRIPTION
		Creates a new local user account
	.PARAMETER UserName
		Name of the user to create
	.EXAMPLE
		New-LxLocalUser adammcchesney
	.EXAMPLE
		PS C:\> New-User adammcchesney -WhatIf
	.NOTES
		Creates user
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