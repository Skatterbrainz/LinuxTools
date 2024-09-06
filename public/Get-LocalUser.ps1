function Get-LocalUser {
	<#
	.SYNOPSIS
		Get local users
	.DESCRIPTION
		Get local user accounts
	.PARAMETER Name
		Optional. Name of user to return. Default is to return all users.
	.EXAMPLE
		Get-LocalUser
	.EXAMPLE
		Get-LocalUser -Name "frank.zappa"
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LocalUser.md
	#>
	param (
		[parameter()][string]$Name
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
			$row = [ordered]@{
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
			sudo chage -l $uname |
				ForEach-Object {
					$keyset = $_.Split(':')
					$keyname = $keyset[0].Trim() -replace ' ','_'
					$keyval  = $keyset[1].Trim()
					$row[$keyname] = $keyval
				}
			$row = [pscustomobject]$row
			$null = $results.Add($row)
		}
		if (![string]::IsNullOrWhiteSpace($Name)) {
			$results | Where-Object {($_.Name -eq $Name)}
		} else {
			$results | Sort-Object Name
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}