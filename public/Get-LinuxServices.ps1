function Get-LinuxServices {
	<#
	.SYNOPSIS
		Get Linux services
	.DESCRIPTION
		Get Linux services and basic configuration settings
	.PARAMETER Name
		Optional. Name of service to return. Default is to return all services.
	.EXAMPLE
		Get-LinuxServices
	.EXAMPLE
		Get-LinuxServices -Name "foo"
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxServices.md
	#>
	[CmdletBinding()]
	param (
		[parameter()][string]$Name
	)
	$cname = Invoke-Command -ScriptBlock { hostname }
	$services = Invoke-Command -ScriptBlock { cat /etc/services } | Where-Object {![string]::IsNullOrWhiteSpace($_) -and $_.Substring(0,1) -ne '#'}
	foreach ($item in $services) {
		$parts = $item.Split("`t") | Where-Object {![string]::IsNullOrWhiteSpace($_)}
		$name = $parts[0]
		$prtx = $parts[1].Split('/')
		$port = $prtx[0]
		$prot = $prtx[1]
		$alx  = $null
		if ($parts.Count -gt 2) {
			$alx = $parts[2].Split("#")
			if ($alx.Count -gt 1) {
				$axx = $alx[0].Trim()
				$cmt = $alx[1].Trim()
			} else {
				$axx = $alx
				$cmt = $null
			}
		}
		[pscustomobject]@{
			Name     = $name
			Port     = $port
			Protocol = $prot
			Aliases  = $axx
			Comment  = $cmt
			Computer = $cname
		}
		# "moira-update	777/tcp		moira_update	# Moira update protocol"
	}
}