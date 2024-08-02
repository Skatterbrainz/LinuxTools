function Get-NetworkInfo {
	<#
	.SYNOPSIS
		Get basic network information
	.DESCRIPTION
		Get basic network information, including local IP address, default gateway, DNS servers, MAC address, and subnet mask.
	.PARAMETER IncludePublicIP
		Include the public IP address in the output
	.PARAMETER PublicResolver
		URI to a public IP address resolver service
	.EXAMPLE
		Get-NetworkInfo
	.EXAMPLE
		Get-NetworkInfo -IncludePublicIP
	.EXAMPLE
		Get-NetworkInfo -IncludePublicIP -PublicResolver 'https://checkip.amazonaws.com'
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-NetworkInfo.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][Switch]$IncludePublicIP,
		[parameter()][string]$PublicResolver = 'http://ipconfig.me/ip' # or 'https://checkip.amazonaws.com'
	)
	$localIP = (hostname -I | awk '{print $1}').Trim()
	if ( -not $localIP) {
		Write-Error "No local IP was found. Check your network cable / wifi settings." -ErrorAction Stop
	}
	$subnetMask     = ip addr show $(ip route | grep default | awk '{print $5}') | awk '/inet / {print $2}' | cut -d '/' -f 2
	$defaultGateway = (ip route show default | awk '{print $3}').Trim()
	$dnsServers     = (grep nameserver /etc/resolv.conf | awk '{print $2}').Trim()
	$macAddress     = ip add | grep link/ether | awk '{print $2}'
	$Obj = [PSCustomObject]@{
		"LocalIP"        = $localIP
		"DefaultGateway" = $defaultGateway
		"DNSServer(s)"   = $dnsServers -split '\r\n'
		"MAC Address"    = $macAddress
		"SubnetMask"     = $subnetMask
	}
	if ($IncludePublicIP) {
		$PublicIP = Invoke-RestMethod -Uri $PublicResolver
		$Obj | Add-Member -MemberType NoteProperty -Name 'PublicIP' -Value $PublicIP 
	}
	return $Obj
}