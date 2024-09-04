function Get-LenovoDevice {
	<#
	.SYNOPSIS
		Get Lenovo device information
	.DESCRIPTION
		Get Lenovo device information using the Lenovo API.
	.PARAMETER SerialNumber
		Optional. Specify the serial number of the Lenovo device. If not specified, the script will attempt to retrieve it from the system.
	.EXAMPLE
		Get-LenovoDevice
	
	.EXAMPLE
		Get-LenovoDevice -SerialNumber "1234567890"
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LenovoDevice.md
	.NOTES
		Inspired by Damien Van Robaeys' blog post: https://www.vansurksum.com/2021/02/08/get-lenovo-warranty-information-using-powershell/
	#>
	[CmdletBinding()]
	param (
		[Parameter()][string]$SerialNumber
	)
	if ([string]::IsNullOrEmpty($SerialNumber)) {
		$snString = sudo dmidecode -t system | grep Serial
		if (![string]::IsNullOrEmpty($snString)) {
			$SerialNumber = $snString.Split(':')[1].Trim()
		}
	}
	if (![string]::IsNullOrEmpty($SerialNumber)) {
		Invoke-RestMethod -Uri "https://pcsupport.lenovo.com/us/en/api/v4/mse/getproducts?productId=$SerialNumber"
	} else {
		Write-Warning "Serial number not found"
	}
}