function Update-LocalUser {
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true)][string]$Name,
		[parameter()][switch]$NewPassword,
		[parameter()][switch]$LockAccount,
		[parameter()][string]$Comment
	)
	$User = Get-LocalUser -Name $Name
	if ($User) {
		if ($NewPassword.IsPresent) {
			$NewPassword = Read-Host -Prompt "Enter new password for $Name" -AsSecureString
			usermod --password $NewPassword $Name
		}
		if ($LockAccount) {
			Disable-LocalUser -Name $Name
		}
		if (![string]::IsNullOrEmpty($Comment)) {
			Set-LocalUser -Name $Name -Description $Comment
		}
	} else {
		Write-Error "User $Name not found."
	}
}