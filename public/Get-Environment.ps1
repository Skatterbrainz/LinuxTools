function Get-Environment {
	<#
	.SYNOPSIS
		Get system environment variables
	.DESCRIPTION
		Returns system environment variables
	.PARAMETER Name
		Optional. Name of environment variable. Default is to return all variables.
	.EXAMPLE
		Get-Environment
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-Environment.md
	#>
	param(
		[parameter()][string]$Name
	)
	[pscustomobject]$([System.Environment]::GetEnvironmentVariables())
}