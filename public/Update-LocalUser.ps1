function Update-LocalUser {
	<#
	.SYNOPSIS
		Update a local user account
	.DESCRIPTION
		Update a local user account with new settings
	.PARAMETER Name
		Name of the user to update
	.PARAMETER NewPassword
		Optional. New password for the user. Must be a secure string.
		This parameter is ignored if -Lock or -Unlock is used.
	.PARAMETER Lock
		Optional. Lock the user account. Ignores -NewPassword
	.PARAMETER Unlock
		Optional. Unlock the user account. Ignores -NewPassword
	.PARAMETER Comment
		Optional. Comment to assign to the user account.
	.PARAMETER HomeDirectory
		Optional. New home directory for the user.
	.PARAMETER MoveHome
		Optional. Move the home directory to the new location.
	.PARAMETER ShellPath
		Optional. New shell path for the user.
	.PARAMETER GroupID
		Optional. New group ID for the user.
	.PARAMETER AccountExpires
		Optional. Date when the account expires. Use 'MM/dd/yyyy' format.
	.PARAMETER UID
		Optional. New user ID
	.EXAMPLE
		Update-LocalUser -Name "Fu Barr" -Comment "The Fubar of Tarfu"
		Updates the user account named "Fu Barr" with the comment "The Fubar of Tarfu"
	.EXAMPLE
		Update-LocalUser -Name "Fu Barr" -HomeDirectory "/home/fubar" -MoveHome
		Updates the user account named "Fu Barr" with the home directory "/home/fubar" and moves the home directory
	.EXAMPLE
		Update-LocalUser -Name "Fu Barr" -ShellPath "/bin/zsh"
		Updates the user account named "Fu Barr" with the shell path "/bin/zsh"
	.EXAMPLE
		Update-LocalUser -Name "Fu Barr" -GroupID 1001
		Updates the user account named "Fu Barr" with the group ID 1001
	.EXAMPLE
		Update-LocalUser -Name "Fu Barr" -AccountExpires "5/1/2025"
		Updates the user account named "Fu Barr" with the account expiration date of May 1, 2025
	.EXAMPLE
		Update-LocalUser -Name "Fu Barr" -NewPassword (ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force)
		Updates the user account named "Fu Barr" with the new password "P@ssw0rd"
	.EXAMPLE
		Update-LocalUser -Name "Fu Barr" -Lock
		Locks the user account named "Fu Barr"
	.EXAMPLE
		Update-LocalUser -Name "Fu Barr" -Unlock
		Unlocks the user account named "Fu Barr"
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Update-LocalUser.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true)][string]$Name,
		[parameter(Mandatory=$false)][securestring]$NewPassword,
		[parameter(Mandatory=$false)][switch]$Lock,
		[parameter(Mandatory=$false)][switch]$Unlock,
		[parameter(Mandatory=$false)][string]$Comment,
		[parameter(Mandatory=$false)][string]$HomeDirectory,
		[parameter(Mandatory=$false)][switch]$MoveHome,
		[parameter(Mandatory=$false)][string]$ShellPath,
		[parameter(Mandatory=$false)][int32]$GroupID,
		[parameter(Mandatory=$false)][string]$AccountExpires,
		[parameter(Mandatory=$false)][int32]$UID
	)
	try {
		$User = Get-LocalUser -Name $Name
		if (!$User) {
			throw "User account '$Name' not found"
		}
		$basecmd = "sudo usermod"
		if ($Lock.IsPresent) {
			$basecmd += " --lock"
		} elseif ($Unlock.IsPresent) {
			$basecmd += " --unlock"
		} elseif (![string]::IsNullOrEmpty($NewPassword)) {
			$basecmd += " --password $NewPassword"
		}
		if (![string]::IsNullOrEmpty($Comment)) {
			$basecmd += " --comment `"$Comment`""
		}
		if (![string]::IsNullOrEmpty($HomeDirectory)) {
			$currentHome = Get-LocalUser $Name | Select-Object -ExpandProperty Home
			if ($currentHome -ne $HomeDirectory) {
				$basecmd += " --home $HomeDirectory"
				if ($MoveHome.IsPresent) {
					$basecmd += " --move-home"
				}
			} else {
				Write-Warning "Home directory is already set to $HomeDirectory"
			}
		}
		if (![string]::IsNullOrEmpty($ShellPath)) {
			$currentShell = Get-LocalUser $Name | Select-Object -ExpandProperty Shell
			if ($currentShell -ne $ShellPath) {
				$basecmd += " --shell $ShellPath"
			} else {
				Write-Warning "Shell path is already set to $ShellPath"
			}
		}
		if ($GroupID) {
			$currentGroup = Get-LocalUser $Name | Select-Object -ExpandProperty GroupID
			if ($currentGroup -ne $GroupID) {
				$basecmd += " --gid $GroupID"
			} else {
				Write-Warning "Group ID is already set to $GroupID"
			}
		}
		if (![string]::IsNullOrEmpty($AccountExpires)) {
			$currentExpires = Get-LocalUser $Name | Select-Object -ExpandProperty Account_expires
			if ($currentExpires -ne $AccountExpires) {
				try {
					$dt = [datetime]::Parse($AccountExpires)
					$basecmd += " --expiredate $(Get-Date $dt -Format 'MM/dd/yyyy')"
				} catch {
					throw "Invalid date format. Use 'MM/dd/yyyy'"
				}
			} else {
				Write-Warning "Account expiration date is already set to $AccountExpires"
			}
		}
		if ($UID) {
			$currentUID = Get-LocalUser $Name | Select-Object -ExpandProperty ID
			if ($currentUID -ne $UID) {
				$basecmd += " --uid $UID"
			} else {
				Write-Warning "User ID is already set to $UID"
			}
		}
		if (![string]::IsNullOrEmpty($ShellPath)) {
			$currentShell = Get-LocalUser $Name | Select-Object -ExpandProperty Shell
			if ($currentShell -ne $ShellPath) {
				$basecmd += " --shell $ShellPath"
			} else {
				Write-Warning "Shell path is already set to $ShellPath"
			}
		}
		$basecmd += " $Name"
		Write-Verbose $basecmd
		Invoke-Expression $basecmd
		Get-LocalUser -Name $Name
	} catch {
		Write-Error $_.Exception.Message
	}
}