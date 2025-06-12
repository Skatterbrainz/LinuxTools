function New-LocalUser {
	<#
	.SYNOPSIS
		Create a new local user account
	.DESCRIPTION
		Create a new local user account
	.PARAMETER Name
		Name of the user to create
	.PARAMETER UID
		Optional. User ID
	.PARAMETER Password
		Optional. Password for the user. Must be a secure string.
	.PARAMETER HomeDirectory
		Optional. Home directory for the user. Default is "/home/$Name"
	.PARAMETER NoHomeDirectory
		Optional. Do not create a home directory
	.PARAMETER ShellPath
		Optional. Path to the user's shell. Default is "/bin/bash"
	.PARAMETER GroupID
		Optional. Group ID
	.PARAMETER Comment
		Comment to assign to the new user account
	.PARAMETER AccountExpires
		Optional. Date when the account expires
	.EXAMPLE
		New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu"
		Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu"
	.EXAMPLE
		New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -AccountExpires "5/1/2025"
		Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu" and expires on May 1, 2025
	.EXAMPLE
		New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -Password (ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force)
		Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu" and sets the password to "P@ssw0rd"
	.EXAMPLE
		New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -HomeDirectory "/home/fubar" -ShellPath "/bin/zsh"
		Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu", home directory "/home/fubar", and shell path "/bin/zsh"
	.EXAMPLE
		New-LocalUser -Name "Fu Barr" Comment "The Fubar of Tarfu" -NoHomeDirectory
		Creates a new user account named "Fu Barr" with the comment "The Fubar of Tarfu" and does not create a home directory
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-LocalUser.md
	.NOTES
		This function requires superuser privileges to create a user account.
		Ensure that you have the necessary permissions to run this command.
		Use with caution, as it will permanently create a new user account.
	#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)][string]$Name,
		[parameter(Mandatory=$false)][int32]$UID,
		[Parameter(Mandatory=$true)][string]$Comment,
		[Parameter(Mandatory=$false)][securestring]$Password,
		[parameter(Mandatory=$false)][string]$HomeDirectory = "/home/$Name",
		[parameter(Mandatory=$false)][string]$ShellPath = "/bin/bash",
		[parameter(Mandatory=$false)][int32]$GroupID,
		[Parameter(Mandatory=$false)][string]$AccountExpires,
		[parameter(Mandatory=$false)][switch]$NoHomeDirectory
	)
	try {
		$test = Get-LocalUser -Name $Name
		if ($test) {
			throw "User account '$Name' already exists"
		}
		$basecmd = "sudo useradd"
		if ($UID) { $basecmd += " --uid $UID" }
		if ($GroupID) { $basecmd += " --gid $GroupID" }
		if ($NoHomeDirectory.IsPresent) {
			$basecmd += " --no-create-home"
		} elseif (![string]::IsNullOrEmpty($HomeDirectory)) {
			$basecmd += " --home-dir $HomeDirectory --create-home"
		}
		if ($ShellPath) { $basecmd += " --shell $ShellPath" }
		if ($Comment) { $basecmd += " --comment `"$Comment`"" }
		if ($AccountExpires) {
			try {
				$dt = [datetime]::Parse($AccountExpires)
				$basecmd += " --expiredate $(Get-Date $dt -Format 'MM/dd/yyyy')"
			} catch {
				throw "Invalid date format. Use 'MM/dd/yyyy'"
			}
		}
		if ($Password) { $basecmd += " --password $Password" }
		$basecmd += " $Name"
		Write-Verbose $basecmd
		Invoke-Expression $basecmd
		Get-LocalUser -Name $Name
	} catch {
		Write-Error $_.Exception.Message
	}
}