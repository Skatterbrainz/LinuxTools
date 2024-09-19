function Get-ComputerInventory {
	<#
	.SYNOPSIS
		Get hardware and software inventory of the local computer.
	.DESCRIPTION
		This script will gather hardware and software inventory of the local computer and output the results to a JSON file.
		Optionally, the results can be sent to a REST API endpoint.
	.PARAMETER DesintationPath
		The path to save the inventory files to.
		Example \\server\share
	.PARAMETER SasURI
		Optional SAS URI for an Azure Storage Account to upload the inventory file to.
		Format is https://<storageaccount>.blob.core.windows.net/<container>/<blob>?<sas-token>
	.EXAMPLE
		Get-ComputerInventory -DestinationPath "\\server\share"

		Saves the inventory file to \\server\share. The file name is <hostname>_inventory.json
	.EXAMPLE
		Get-ComputerInventory -SasURI "https://<storageaccount>.blob.core.windows.net/<container>/<blob>?<sas-token>"

		Sends the inventory file to Azure Blob Storage. The file name is <hostname>_inventory.json
	.EXAMPLE
		Get-ComputerInventory

		Saves the inventory file to the user's Documents folder. File name is <hostname>_inventory.json
	.NOTES
		Azure Blob Container requires permissions: Add, Create, Write, List

		Any data missing? Let me know!
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ComputerInventory.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][string]$DestinationPath,
		[parameter()][string]$SasURI
	)

	try {
		if (!$IsLinux) {
			throw "This script is intended for Linux systems only."
		}

		$hostname = hostname
		$invFile = Join-Path $env:HOME "Documents/$($hostname)_inventory.json"

		function Add-FileToBlobStorage {
			Param(
				[Parameter(Mandatory=$true)][ValidateScript({Test-Path $_ })][string]$File,
				[Parameter(Mandatory=$true)]
				[ValidateScript({$_ -match "https\:\/\/(.)*\.blob.core.windows.net\/(.)*\?(.)*"})]
				[string]$ConnectionString
			)
			$HashArguments = @{
				uri     = $connectionstring.Replace("?","/$($(Get-Item $file).Name)?")
				method  = "Put"
				InFile  = $file
				headers = @{"x-ms-blob-type" = "BlockBlob"}
			}
			Invoke-RestMethod @HashArguments
		}

		$appsAPT     = Get-AptPkgInventory
		$appsFlatpak = Get-FlatpakInventory
		$appsSnap    = Get-SnapInventory
		$localUsers  = Get-LocalUser
		$localGroups = Get-LocalGroup
		$compInfo    = Get-ComputerInfo
		$netInfo     = Get-NetworkInfo -IncludePublicIP

		$inventory = @{
			"ComputerSystem"   = $compInfo
			"NetworkConfig"    = $netInfo
			"InstalledAPT"     = $appsAPT
			"InstalledFlatpak" = $appsFlatpak
			"InstalledSnap"    = $appsSnap
			"LocalUsers"       = $localUsers
			"LocalGroups"      = $localGroups
		}

		Write-Verbose "Writing inventory to $invFile"
		$inventory | ConvertTo-Json -Depth 3 | Out-File -FilePath $invFile -Encoding utf8 -Force

		if (![string]::IsNullOrEmpty($SasURI)) {
			Write-Verbose "uploading inventory file to azure blob storage"
			Add-FileToBlobStorage -File $invFile -ConnectionString $SasURI
		} elseif (![string]::IsNullOrEmpty($DestinationPath)) {
			write-verbose "uploading inventory file to $DestinationPath"
			Copy-Item -Path $invFile -Destination $DestinationPath -Force
		} else {
			Write-Host "File saved to: $invFile"
		}
		Write-Output 0
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
		Write-Output 1
	}
}