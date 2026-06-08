function Get-NetworkConnections {
	<#
	.SYNOPSIS
		Gets listening and active network socket connections.
	.DESCRIPTION
		Uses ss to return listening and active sockets with process details when available.
	.PARAMETER ListeningOnly
		If specified, returns listening sockets only.
	.EXAMPLE
		Get-NetworkConnections
		Returns network sockets.
	.EXAMPLE
		Get-NetworkConnections -ListeningOnly
		Returns listening sockets only.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-NetworkConnections.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][switch]$ListeningOnly
	)
	try {
		if (-not (Get-Command -Name ss -ErrorAction SilentlyContinue)) {
			throw 'ss command not found'
		}
		$cmd = if ($ListeningOnly) { 'ss -tulnpH' } else { 'ss -tunapH' }
		$rows = Invoke-Expression $cmd
		foreach ($line in $rows) {
			if ([string]::IsNullOrWhiteSpace($line)) {
				continue
			}
			$parts = $line.Split(' ') | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
			if ($parts.Count -lt 5) {
				continue
			}
			[pscustomobject]@{
				SourceType = 'socket'
				NetId      = $parts[0]
				State      = $parts[1]
				Local      = $parts[3]
				Remote     = $parts[4]
				Process    = if ($parts.Count -gt 5) { ($parts[5..($parts.Count-1)] -join ' ') } else { $null }
				Raw        = $line
			}
		}
	} catch {
		Write-Error $($_.Exception.Message -join(';'))
	}
}