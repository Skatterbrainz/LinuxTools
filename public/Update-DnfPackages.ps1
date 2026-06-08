function Update-DnfPackages {
	<#
	.SYNOPSIS
		Update DNF packages
	.DESCRIPTION
		Update DNF packages on a Linux system using the dnf package manager.
	.EXAMPLE
		Update-DnfPackages
		Updates all installed DNF packages to their latest versions.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-DnfPackages.md
	.NOTES
		This function requires the dnf package manager to be installed on the system.
		Ensure that you have the necessary permissions to run this command, as it may require superuser privileges.
	#>
	[CmdletBinding()]
	param()
	try {
		InvokeLinuxPackageUpdate -Type 'dnf'
	} catch {
		Write-Error $_.Exception.Message
	}
}