function Get-FirewallStatus {
	<#
	.SYNOPSIS
		Get the status of the firewall on the system.
	.DESCRIPTION
		This function gets the status of the firewall on the system.
	.EXAMPLE
		Get-FirewallStatus

		Get the status of the firewall on the system.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-FirewallStatus.md
	#>
	param (
		[parameter(Mandatory = $false)][switch]$Detailed
	)
	if ($Detailed.IsPresent) {
		$lines = Invoke-Command -ScriptBlock { sudo ufw status } -ErrorAction Stop |
			Where-Object {$_ -notlike "Status*" -and $_ -notlike 'To*' -and $_ -notlike '--*' -and ![string]::IsNullOrEmpty($_)}

		foreach ($line in $lines) {
			$port   = $line.Substring(0, 27).Trim()
			$action = $line.Substring(27, 11).Trim()
			$from   = $line.Substring(38).Trim()
			[pscustomobject]@{
				Port   = $port
				Action = $action
				From   = $from
			}
		}
		return
	} else {
		$result = @{}
		$line1 = Invoke-Command -ScriptBlock { sudo ufw status } -ErrorAction Stop
		$result.Add("Status", $($line1.Split(":")[1].Trim()))
		$line2 = Invoke-Command -ScriptBlock { sudo ufw version } -ErrorAction Stop
		foreach ($line in $line2) {
			if ($line -match "ufw") {
				$result.Add("Version", $($line.Split(" ")[1].Trim()))
			}
			if ($line -match "Copyright") {
				$result.Add("Copyright", $line)
			}
		}
		[pscustomobject]$result
	}
}