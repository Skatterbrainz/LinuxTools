function Get-USBDevices {
	<#
	.SYNOPSIS
		Get a list of USB devices.
	.DESCRIPTION
		Get a list of USB devices. This function uses the `lsusb` command to retrieve information about connected USB devices and organizes it into a structured format.
	.PARAMETER ShowVerbose
		Whether to show verbose output during processing.
	.EXAMPLE
		Get-USBDevices
		Returns a list of connected USB devices with their details.
	.EXAMPLE
		Get-USBDevices -ShowVerbose
		Returns a list of connected USB devices with verbose output during processing.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-USBDevices.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$false)][switch]$ShowVerbose
	)
	lsusb -v 2>/dev/null | ForEach-Object -Begin {
		$devices          = @()
		$current          = $null
		$currentConfig    = $null
		$currentInterface = $null
		$currentEndpoint  = $null
	} -Process {
		if ($_ -match '^Bus (\d+) Device (\d+): ID ([0-9a-f]{4}):([0-9a-f]{4}) (.+)$') {
			if ($current) { $devices += $current }
			$current = [PSCustomObject]@{
				Bus            = $matches[1]
				Device         = $matches[2]
				VendorID       = $matches[3]
				ProductID      = $matches[4]
				Description    = $matches[5].Trim()
				Configurations = [System.Collections.ArrayList]@()
			}
			$currentConfig = $null; $currentInterface = $null; $currentEndpoint = $null
		}
		elseif ($_ -match '^Device Descriptor:$') { }
		elseif ($_ -match '^  Configuration Descriptor:$') {
			$currentConfig = [PSCustomObject]@{ Interfaces = [System.Collections.ArrayList]@() }
			[void]$current.Configurations.Add($currentConfig)
			$currentInterface = $null; $currentEndpoint = $null
		}
		elseif ($_ -match '^    Interface Descriptor:$') {
			$currentInterface = [PSCustomObject]@{ Endpoints = [System.Collections.ArrayList]@() }
			[void]$currentConfig.Interfaces.Add($currentInterface)
			$currentEndpoint = $null
			if ($ShowVerbose) { Write-Verbose "Found Interface Descriptor" }
		}
		elseif ($_ -match '^      Endpoint Descriptor:$') {
			$currentEndpoint = [PSCustomObject]@{}
			# Don't add to collection yet - wait until we have actual properties
			if ($ShowVerbose) { Write-Verbose "Found Endpoint Descriptor" }
		}
		elseif ($_ -match '^  (.+?):\s+(.+)$') {
			$key = $matches[1].Trim() -replace '[^\w]', ''
			$current | Add-Member -NotePropertyName $key -NotePropertyValue $matches[2].Trim() -Force
		}
		elseif ($_ -match '^    (.+?):\s+(.+)$' -and $currentConfig) {
			$key = $matches[1].Trim() -replace '[^\w]', ''
			$currentConfig | Add-Member -NotePropertyName $key -NotePropertyValue $matches[2].Trim() -Force
		}
		elseif ($_ -match '^      ([a-zA-Z][^:]*?)\s+(.+)$' -and $currentInterface -and $_ -notmatch 'Descriptor:$' -and $_ -notmatch '^        ') {
			$key = $matches[1].Trim() -replace '[^\w]', ''
			$value = $matches[2].Trim()
			if ($key -ne '') {
				$currentInterface | Add-Member -NotePropertyName $key -NotePropertyValue $value -Force
				if ($ShowVerbose) { Write-Verbose "Added Interface property: $key = $value" }
			}
		}
		elseif ($_ -match '^        ([a-zA-Z][^:]*?)\s+(.+)$' -and $currentEndpoint -and $_ -notmatch 'Descriptor:$' -and $_ -notmatch '^          ') {
			$key = $matches[1].Trim() -replace '[^\w]', ''
			$value = $matches[2].Trim()
			if ($key -ne '') {
				$currentEndpoint | Add-Member -NotePropertyName $key -NotePropertyValue $value -Force
				# Add endpoint to collection on first property (ensures it has content)
				if ($currentInterface.Endpoints -notcontains $currentEndpoint) {
					[void]$currentInterface.Endpoints.Add($currentEndpoint)
				}
				if ($ShowVerbose) { Write-Verbose "Added Endpoint property: $key = $value" }
			}
		}
		elseif ($_ -match '^          ([a-zA-Z][^:]*?)\s+(.+)$' -and $currentEndpoint) {
			# Handle nested endpoint properties (like Transfer Type, Synch Type, etc.)
			$key = $matches[1].Trim() -replace '[^\w]', ''
			$value = $matches[2].Trim()
			if ($key -ne '') {
				$currentEndpoint | Add-Member -NotePropertyName $key -NotePropertyValue $value -Force
				if ($ShowVerbose) { Write-Verbose "Added nested Endpoint property: $key = $value" }
			}
		}
	} -End {
		if ($current) { $devices += $current }
		
		# Convert ArrayLists to arrays for proper object structure
		foreach ($device in $devices) {
			if ($device.Configurations) {
				$device.Configurations = @($device.Configurations)
				foreach ($config in $device.Configurations) {
					if ($config.Interfaces) {
						# First, filter endpoints for each interface
						foreach ($interface in $config.Interfaces) {
							if ($interface.Endpoints) {
								# Filter out empty endpoints (those with no properties)
								$validEndpoints = @($interface.Endpoints | Where-Object { 
									($_ | Get-Member -MemberType NoteProperty).Count -gt 0 
								})
								$interface.Endpoints = $validEndpoints
							}
						}
						
						# Keep all interfaces - they may have properties even without endpoints
						$config.Interfaces = @($config.Interfaces)
					}
				}
			}
		}
		
		$devices
	}
}