<#
.SYNOPSIS
Get local users

.DESCRIPTION
Get local user accounts

.PARAMETER Identity
Optional. Name of user to return. Default is to return all users.

.EXAMPLE
Get-LxLocalUser

.EXAMPLE
Get-LxLocalUser -Identity "frank.zappa"

.LINK
https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LxLocalUser.md
#>
function Get-LxLocalUser {
	param (
		[parameter()][string]$Identity
	)
	try {
		$results = [System.Collections.ArrayList]::new()
		$users = Invoke-Command -ScriptBlock { cat /etc/passwd }
		$computer = Invoke-Command -ScriptBlock { hostname }
		foreach ($user in $users) {
			$udata = $user.Split(":")
			$uname = $udata[0]
			$gdata = Invoke-Command -ScriptBlock { groups $uname }
			if (![string]::IsNullOrWhiteSpace($gdata)) {
				$groups = $gdata.Split(":")[1].Trim().Split(' ')
			} else {
				$groups = $null
			}
			$row = [pscustomobject]@{
				Name     = $udata[0]
				Password = if ($udata[1] -eq 'x') { '********'} else { $udata[1] }
				ID       = $udata[2]
				GroupID  = $udata[3]
				Groups   = $($groups)
				Comment  = $udata[4]
				Home     = $udata[5]
				Shell    = $udata[6]
				Computer = $computer
			}
			$null = $results.Add($row)
		}
		if (![string]::IsNullOrWhiteSpace($Identity)) {
			$results | Where-Object {($_.Name -eq $Identity)}
		} else {
			$results | Sort-Object ID,Name
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}