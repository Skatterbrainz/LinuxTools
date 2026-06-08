# add helper functions here
function getGridSelect {
	<#
	.SYNOPSIS
		Display a grid view of the specified data set and return the selected item(s)
	.DESCRIPTION
		Display a grid view of the specified data set and return the selected item(s)
	.PARAMETER DataSet
		Specify the data set (array, arraylist, collection) to display in the grid view
	.PARAMETER Title
		Specify the title of the grid view window
	.PARAMETER OutputMode
		Specify the output mode: Single or Multiple. Default is Multiple
	.EXAMPLE
		getGridSelect -DataSet $users -Title "Select a User Account" -OutputMode Single
		Display a grid view of the specified data set and return the selected item
	.EXAMPLE
		getGridSelect -DataSet $users -Title "Select User Accounts"
		Display a grid view of the specified data set and return the selected item(s)
	#>
	param (
		[parameter(Mandatory=$True)]$DataSet,
		[parameter(Mandatory=$True)][string]$Title,
		[parameter(Mandatory=$False)][string][ValidateSet('Single','Multiple')]$OutputMode = 'Multiple'
	)
	if (Get-Module Microsoft.PowerShell.ConsoleGuiTools -ListAvailable) {
		@($DataSet | Out-ConsoleGridView -Title $Title -OutputMode $OutputMode)
	} else {
		Write-Warning "Linux platforms require module: microsoft.powershell.consoleguitools"
	}
}

function IsCinnamonInstalled {
	<#
	.SYNOPSIS
		Determine if Cinnamon desktop is installed
	.DESCRIPTION
		Determine if Cinnamon desktop is installed
	#>
	param()
	if (-not (Test-Path -Path "/usr/bin/cinnamon")) {
		Write-Output $false
		$global:IsCinnamon = $false
		return
	}
	$desktop = Get-ChildItem -Path "/usr/share/xsessions" -Filter "cinnamon.desktop" -ErrorAction SilentlyContinue
	if ($desktop) {
		Write-Output $true
		$global:IsCinnamon = $true
	} else {
		Write-Output $false
		$global:IsCinnamon = $false
	}
}

function Get-LogFile {
	param()
	Get-Content -Path $global:LogFilePath -ErrorAction SilentlyContinue
}

function get-NullString {
	param(
		[parameter(Mandatory=$false)][string]$String
	)
	if ([string]::IsNullOrEmpty($String)) {
		return ""
	} else {
		return $String.Trim()
	}
}

function TestCinnamonComponentPath {
	param(
		[parameter(Mandatory=$true)][ValidateSet('applets','extensions','spices')][string]$Type
	)
	$path = switch ($Type) {
		'applets' { '~/.local/share/cinnamon/applets' }
		'extensions' { '~/.local/share/cinnamon/extensions' }
		'spices' { '~/.config/cinnamon/spices' }
	}
	Test-Path -Path $path
}

function ReadCinnamonComponentData {
	param(
		[parameter(Mandatory=$true)][ValidateSet('applets','extensions','spices')][string]$Type,
		[parameter(Mandatory=$false)][string]$Name
	)
	$path = switch ($Type) {
		'applets' { '~/.local/share/cinnamon/applets' }
		'extensions' { '~/.local/share/cinnamon/extensions' }
		'spices' { '~/.config/cinnamon/spices' }
	}
	if (-not (Test-Path -Path $path)) {
		throw "Required path not found: $path"
	}
	if ($Type -eq 'spices') {
		$spiceDirs = Get-ChildItem -Path $path -Directory -ErrorAction Stop
		if ([string]::IsNullOrWhiteSpace($Name)) {
			$spiceDirs | Select-Object -Property @{n='ComponentType';e={'spices'}}, Name, @{n='ShortName';e={$_.Name.Split('@')[0]}}, FullName
			return
		}
		$spiceDirs |
			Where-Object { $_.Name -like "*$Name*" -or $_.BaseName -like "*$Name*" } |
			ForEach-Object {
				$spiceName = $_.BaseName
				Get-ChildItem -Path $_.FullName -File -Filter '*.json' -ErrorAction SilentlyContinue |
					ForEach-Object {
						$baseName = $_.BaseName
						Get-Content -Path $_.FullName -Raw | ConvertFrom-Json |
							Select-Object -Property *, @{n='ComponentType';e={'spices'}}, @{n='Name';e={$spiceName}}, @{n='ShortName';e={$baseName}}, @{n='SourcePath';e={$_.PSPath}}
					}
			}
		return
	}
	Get-ChildItem -Path $path -File -Filter 'metadata.json' -Recurse -ErrorAction Stop |
		ForEach-Object {
			$componentFile = $_
			$metadata = Get-Content -Path $componentFile.FullName -Raw | ConvertFrom-Json
			if (-not [string]::IsNullOrWhiteSpace($Name)) {
				$matchValues = @(
					$componentFile.Directory.Name,
					$metadata.uuid,
					$metadata.name,
					$metadata.description,
					$metadata.'short-description'
				) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
				if (-not ($matchValues | Where-Object { $_ -like "*$Name*" })) {
					return
				}
			}
			$metadata | Select-Object -Property *, @{n='ComponentType';e={$Type}}, @{n='SourcePath';e={$componentFile.Directory.FullName}}
		}
}

function ReadAllCinnamonComponents {
	param(
		[parameter(Mandatory=$false)][ValidateSet('applets','extensions','spices','all')][string]$Type = 'spices',
		[parameter(Mandatory=$false)][string]$Name
	)
	$result = @()
	$targets = if ($Type -eq 'all') { 'applets','extensions','spices' } else { @($Type) }
	foreach ($target in $targets) {
		if ($Type -ne 'all' -or (TestCinnamonComponentPath -Type $target)) {
			$result += @(ReadCinnamonComponentData -Type $target -Name $Name)
		}
	}
	$result
}

function TestLinuxPackageManager {
	param(
		[parameter(Mandatory=$true)][ValidateSet('apt','flatpak','snap','dnf')][string]$Type
	)
	# To do: use Get-Command to validate each option
	switch ($Type) {
		'apt' { Test-Path -Path '/usr/bin/apt' }
		'flatpak' { Test-Path -Path '/usr/bin/flatpak' }
		'snap' { Test-Path -Path '/usr/bin/snap' }
		'dnf' { Test-Path -Path '/usr/bin/dnf' }
	}
}

function ReadAptPackageData {
	param(
		[parameter(Mandatory=$false)][switch]$Upgradable
	)
	if (-not (Test-Path -Path '/usr/bin/apt')) {
		throw "Required file not found: apt"
	}
	Write-Host "Updating apt cache..."
	sudo apt update | Out-Null
	$apps = if ($Upgradable) {
		sudo apt list --upgradable 2>$null
	} else {
		sudo apt list 2>$null
	}
	foreach ($line in $apps) {
		if ([string]::IsNullOrWhiteSpace($line) -or $line -match '^(Listing|WARNING:)') {
			continue
		}
		if ($line -match '^(?<Name>[^/]+)/\S+\s+(?<Current>\S+)\s+(?<Rev>\S+)(?:\s+\[(?<Status>[^\]]+)\])?') {
			$available = $null
			if ($matches['Status'] -like 'upgradable from:*') {
				$available = $matches['Status'].Replace('upgradable from: ', '')
			}
			[pscustomobject]@{
				SourceType = 'apt'
				Name       = $matches['Name']
				Current    = $matches['Current']
				Rev        = $matches['Rev']
				Available  = $available
			}
		}
	}
}

function ReadDnfPackageData {
	param()
	if (-not (Test-Path -Path '/usr/bin/dnf')) {
		throw "Required file not found: dnf"
	}
	$pkgs = dnf list --installed 2>$null
	foreach ($row in $pkgs) {
		if ([string]::IsNullOrWhiteSpace($row) -or $row -match '^(Installed Packages|Last metadata expiration check:)') {
			continue
		}
		$items = $row.Split(' ') | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
		if ($items.Count -ge 3) {
			[pscustomobject]@{
				SourceType = 'dnf'
				Name       = $items[0]
				Version    = $items[1]
				Source     = $items[2]
			}
		}
	}
}

function ReadSnapPackageData {
	param()
	Write-Host "Listing snaps..."
	$snaps = snap list --all 2>$null
	foreach ($line in $snaps) {
		if ([string]::IsNullOrWhiteSpace($line) -or $line -match '^Name\s+Version\s+Rev\s+Tracking\s+Publisher\s+Notes$') {
			continue
		}
		if ($line -match '^(?<Name>\S+)\s+(?<Version>\S+)\s+(?<Rev>\S+)\s+(?<Tracking>\S+)\s+(?<Publisher>\S+)\s*(?<Notes>.*)$') {
			[pscustomobject]@{
				SourceType = 'snap'
				Name       = $matches['Name']
				Version    = $matches['Version']
				Rev        = $matches['Rev']
				Tracking   = $matches['Tracking']
				Publisher  = $matches['Publisher']
				Notes      = $matches['Notes']
			}
		}
	}
}

function ReadFlatpakPackageData {
	param()
	$flatpaks = flatpak list --columns=name,version,application,description,installation,size 2>$null
	foreach ($line in $flatpaks) {
		if ([string]::IsNullOrWhiteSpace($line) -or $line -match '^Name\tVersion\tApplication\tDescription\tInstallation\tSize$') {
			continue
		}
		$pkg = $line.Split("`t") | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
		if ($pkg.Count -ge 6) {
			[pscustomobject]@{
				SourceType      = 'flatpak'
				Name            = $pkg[0]
				Version         = $pkg[1]
				AppId           = $pkg[2]
				Description     = $pkg[3]
				InstallLocation = $pkg[4]
				Size            = $pkg[5]
			}
		}
	}
}

function ReadLinuxPackageData {
	param(
		[parameter(Mandatory=$false)][ValidateSet('apt','flatpak','snap','dnf','all')][string]$Type = 'all',
		[parameter(Mandatory=$false)][switch]$Upgradable
	)
	$result = @()
	if ($Type -in ('apt', 'all')) {
		if ($Type -eq 'apt' -or (TestLinuxPackageManager -Type 'apt')) {
			$result += @(ReadAptPackageData -Upgradable:$Upgradable)
		}
	}
	if ($Type -in ('flatpak', 'all')) {
		if ($Type -eq 'flatpak' -or (TestLinuxPackageManager -Type 'flatpak')) {
			$result += @(ReadFlatpakPackageData)
		}
	}
	if ($Type -in ('snap', 'all')) {
		if ($Type -eq 'snap' -or (TestLinuxPackageManager -Type 'snap')) {
			$result += @(ReadSnapPackageData)
		}
	}
	if ($Type -in ('dnf', 'all')) {
		if ($Type -eq 'dnf' -or (TestLinuxPackageManager -Type 'dnf')) {
			$result += @(ReadDnfPackageData)
		}
	}
	$result
}

function ReadAptPackageUpdates {
	param()
	if (-not (TestLinuxPackageManager -Type 'apt')) {
		throw "Required file not found: apt"
	}
	$apps = apt list --upgradable 2>$null
	foreach ($line in $apps) {
		if ([string]::IsNullOrWhiteSpace($line) -or $line -match '^(Listing|WARNING:)') {
			continue
		}
		if ($line -match '^(?<Name>[^/]+)/\S+\s+(?<Version>\S+)\s+(?<Channel>\S+)(?:\s+\[upgradable from: (?<Installed>[^\]]+)\])?') {
			[pscustomobject]@{
				SourceType       = 'apt'
				Name             = $matches['Name']
				InstalledVersion = $matches['Installed']
				AvailableVersion = $matches['Version']
				Channel          = $matches['Channel']
			}
		}
	}
}

function ReadSnapPackageUpdates {
	param()
	if (-not (TestLinuxPackageManager -Type 'snap')) {
		throw "Required file not found: snap"
	}
	$snaps = snap refresh --list 2>$null
	foreach ($line in $snaps) {
		if ([string]::IsNullOrWhiteSpace($line) -or $line -match '^All snaps up to date\.$' -or $line -match '^Name\s+Version\s+Rev\s+Size\s+Publisher\s+Notes$') {
			continue
		}
		if ($line -match '^(?<Name>\S+)\s+(?<AvailableVersion>\S+)\s+(?<Rev>\S+)\s+(?<Size>\S+)\s+(?<Publisher>\S+)\s*(?<Notes>.*)$') {
			[pscustomobject]@{
				SourceType       = 'snap'
				Name             = $matches['Name']
				InstalledVersion = $null
				AvailableVersion = $matches['AvailableVersion']
				Rev              = $matches['Rev']
				Size             = $matches['Size']
				Publisher        = $matches['Publisher']
				Notes            = $matches['Notes']
			}
		}
	}
}

function ReadFlatpakPackageUpdates {
	param()
	if (-not (TestLinuxPackageManager -Type 'flatpak')) {
		throw "Required file not found: flatpak"
	}
	$flatpaks = flatpak remote-ls --updates --columns=name,application,version,branch,origin,size 2>$null
	foreach ($line in $flatpaks) {
		if ([string]::IsNullOrWhiteSpace($line) -or $line -match '^Name\tApplication\tVersion\tBranch\tOrigin\tSize$') {
			continue
		}
		$pkg = $line.Split("`t") | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
		if ($pkg.Count -ge 6) {
			[pscustomobject]@{
				SourceType       = 'flatpak'
				Name             = $pkg[0]
				AppId            = $pkg[1]
				AvailableVersion = $pkg[2]
				Branch           = $pkg[3]
				Origin           = $pkg[4]
				Size             = $pkg[5]
			}
		}
	}
}

function ReadDnfPackageUpdates {
	param()
	if (-not (TestLinuxPackageManager -Type 'dnf')) {
		throw "Required file not found: dnf"
	}
	$pkgs = dnf check-update 2>$null
	foreach ($row in $pkgs) {
		if ([string]::IsNullOrWhiteSpace($row) -or $row -match '^(Last metadata expiration check:|Obsoleting Packages|Security:|Available Upgrades)$') {
			continue
		}
		$items = $row.Split(' ') | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
		if ($items.Count -ge 3) {
			[pscustomobject]@{
				SourceType       = 'dnf'
				Name             = $items[0]
				AvailableVersion = $items[1]
				Source           = $items[2]
			}
		}
	}
}

function ReadLinuxPackageUpdates {
	param(
		[parameter(Mandatory=$false)][ValidateSet('apt','flatpak','snap','dnf','all')][string]$Type = 'all'
	)
	$result = @()
	if ($Type -in ('apt', 'all')) {
		if ($Type -eq 'apt' -or (TestLinuxPackageManager -Type 'apt')) {
			$result += @(ReadAptPackageUpdates)
		}
	}
	if ($Type -in ('flatpak', 'all')) {
		if ($Type -eq 'flatpak' -or (TestLinuxPackageManager -Type 'flatpak')) {
			$result += @(ReadFlatpakPackageUpdates)
		}
	}
	if ($Type -in ('snap', 'all')) {
		if ($Type -eq 'snap' -or (TestLinuxPackageManager -Type 'snap')) {
			$result += @(ReadSnapPackageUpdates)
		}
	}
	if ($Type -in ('dnf', 'all')) {
		if ($Type -eq 'dnf' -or (TestLinuxPackageManager -Type 'dnf')) {
			$result += @(ReadDnfPackageUpdates)
		}
	}
	$result
}

function InvokeLinuxPackageUpdate {
	param(
		[parameter(Mandatory=$true)][ValidateSet('apt','flatpak','snap','dnf')][string]$Type
	)
	switch ($Type) {
		'apt' {
			if (Test-Path -Path '/usr/bin/nala') {
				Write-Host "Using Nala for package management..."
				sudo nala update
				sudo nala upgrade -y
			} else {
				Write-Host "Using APT for package management..."
				sudo apt update
				sudo apt upgrade -y
			}
		}
		'dnf' {
			if (-not (Test-Path -Path '/usr/bin/dnf')) {
				throw "File not found: dnf"
			}
			Write-Host "Updating DNF packages..."
			sudo dnf upgrade -y
		}
		'flatpak' {
			Write-Host "Updating flatpak packages..."
			flatpak update -y
		}
		'snap' {
			Write-Host "Updating snap packages..."
			sudo snap refresh
		}
	}
}

function ReadLinuxSystemInfo {
	param(
		[parameter(Mandatory=$false)][ValidateSet('basic','detailed')][string]$Detail = 'basic'
	)
	$hostname = (hostname 2>$null)
	$osInfoRaw = (lsb_release -a 2>$null | Out-String).Trim()
	$cpuModel = ((Get-Content /proc/cpuinfo 2>$null | Select-String 'model name' | Select-Object -First 1) -split ':')[-1].Trim()
	$memoryRaw = (free -h 2>$null | Out-String).Trim()
	$diskRaw = (df -h 2>$null | Out-String).Trim()
	$kernel = (uname -r 2>$null)
	$architecture = (uname -p 2>$null)
	$isLinuxMint = $osInfoRaw -match 'Linux Mint'
	$ubuntuBaseVersion = $null
	if ($isLinuxMint -and (Test-Path '/etc/upstream-release/lsb-release')) {
		$ubuntuBaseVersion = Get-Content '/etc/upstream-release/lsb-release' |
			Select-String 'DISTRIB_DESCRIPTION' |
			ForEach-Object { $_ -replace 'DISTRIB_DESCRIPTION="|"', '' }
	}

	if ($Detail -eq 'basic') {
		return [PSCustomObject]@{
			ComputerName       = $hostname
			OperatingSystem    = $osInfoRaw
			Kernel             = $kernel
			Architecture       = $architecture
			CPU                = $cpuModel
			Memory             = $memoryRaw
			DiskSpace          = $diskRaw
			UbuntuBaseVersion  = if ($isLinuxMint) { $ubuntuBaseVersion } else { $null }
		}
	}

	$results = [ordered]@{
		ComputerName      = $hostname
		OperatingSystem   = $osInfoRaw
		Kernel            = $kernel
		Architecture      = $architecture
		CPU               = $cpuModel
		Memory            = $memoryRaw
		DiskSpace         = $diskRaw
		UbuntuBaseVersion = if ($isLinuxMint) { $ubuntuBaseVersion } else { $null }
	}

	if (Get-Command -Name dmidecode -ErrorAction SilentlyContinue) {
		$canReadDmi = $false
		if ((id -u 2>$null) -eq '0') {
			$canReadDmi = $true
		} else {
			sudo -n true 2>$null | Out-Null
			$canReadDmi = $LASTEXITCODE -eq 0
		}
		if ($canReadDmi) {
			$hw = (sudo -n dmidecode 2>$null | grep -A3 '^System Information') | ForEach-Object { $_.Trim() }
			foreach ($item in $hw) {
				if ($item.Contains(':')) {
					$parts = $item.Split(':') | ForEach-Object { $_.Trim() }
					if ($parts.Count -ge 2) {
						$results[$parts[0].Replace(' ','_').Replace('(','').Replace(')','')] = $parts[1]
					}
				}
			}
			$sn = (sudo -n dmidecode -t system 2>$null | grep Serial)
			$results['SerialNumber'] = if (![string]::IsNullOrEmpty($sn)) { $sn.Split(':')[1].Trim() } else { 'N/A' }
		} else {
			$results['SerialNumber'] = 'N/A'
			$results['DmiAccess'] = 'Requires sudo privileges'
		}
	}

	$lscpu = lscpu 2>$null
	foreach ($item in $lscpu) {
		if ($item.Contains(':')) {
			$parts = $item.Split(':') | ForEach-Object { $_.Trim() }
			if ($parts.Count -ge 2) {
				$results[$parts[0].Replace(' ','_').Replace('(','').Replace(')','')] = $parts[1]
			}
		}
	}

	$bootRaw = (uptime -s 2>$null)
	if (![string]::IsNullOrWhiteSpace($bootRaw)) {
		try {
			$results['LastBoot'] = Get-Date $bootRaw
		} catch {
			$results['LastBoot'] = $bootRaw
		}
	}
	$uptimeRaw = (uptime -p 2>$null)
	if (![string]::IsNullOrWhiteSpace($uptimeRaw)) {
		$results['Uptime'] = if ($uptimeRaw.StartsWith('up ')) { $uptimeRaw.Substring(3) } else { $uptimeRaw }
	}
	[PSCustomObject]$results
}

function ReadMimeAppsDefaults {
	param(
		[parameter(Mandatory=$false)][string]$Path = "$env:HOME/.config/mimeapps.list"
	)
	if (-not (Test-Path -Path $Path)) {
		throw "File not found: $Path"
	}
	$content = Get-Content -Path $Path
	$defaults = @{}
	$inDefaultSection = $false
	foreach ($line in $content) {
		$trimmed = $line.Trim()
		if ([string]::IsNullOrWhiteSpace($trimmed) -or $trimmed.StartsWith('#') -or $trimmed.StartsWith(';')) {
			continue
		}
		if ($trimmed -eq '[Default Applications]') {
			$inDefaultSection = $true
			continue
		}
		if ($trimmed.StartsWith('[')) {
			$inDefaultSection = $false
			continue
		}
		if (-not $inDefaultSection) {
			continue
		}
		if ($trimmed -match '^(?<MimeType>[^=]+)=(?<DesktopEntry>.+)$') {
			$mimeType = $matches['MimeType'].Trim()
			$desktopEntry = ($matches['DesktopEntry'].Split(';') | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Select-Object -First 1)
			if (-not [string]::IsNullOrWhiteSpace($desktopEntry)) {
				$defaults[$mimeType] = $desktopEntry
			}
		}
	}
	$defaults
}

function ReadDefaultApplications {
	param(
		[parameter(Mandatory=$false)][ValidateSet('browser','audio','video','image','text','all')][string]$Category = 'all',
		[parameter(Mandatory=$false)][string]$MimeType,
		[parameter(Mandatory=$false)][string]$Path = "$env:HOME/.config/mimeapps.list"
	)
	$defaults = ReadMimeAppsDefaults -Path $Path
	$rows = foreach ($key in $defaults.Keys) {
		[pscustomobject]@{
			MimeType      = $key
			DesktopEntry  = $defaults[$key]
			Category      = if ($key -like 'x-scheme-handler/http*' -or $key -like 'x-scheme-handler/https*') {
				'browser'
			} elseif ($key -like 'audio/*') {
				'audio'
			} elseif ($key -like 'video/*') {
				'video'
			} elseif ($key -like 'image/*') {
				'image'
			} elseif ($key -like 'text/*') {
				'text'
			} else {
				'other'
			}
		}
	}
	if (-not [string]::IsNullOrWhiteSpace($MimeType)) {
		return @($rows | Where-Object { $_.MimeType -like $MimeType })
	}
	if ($Category -eq 'all') {
		return @($rows)
	}
	@($rows | Where-Object { $_.Category -eq $Category })
}

function ReadDesktopEntries {
	param(
		[parameter(Mandatory=$false)][ValidateSet('user','system','autostart','all')][string]$Location = 'user',
		[parameter(Mandatory=$false)][string]$Name,
		[parameter(Mandatory=$false)][switch]$Contents,
		[parameter(Mandatory=$false)][string]$Path,
		[parameter(Mandatory=$false)][string]$Filter = '*.desktop'
	)
	$paths = switch ($Location) {
		'user' { @('~/.local/share/applications') }
		'system' { @('/usr/share/applications') }
		'autostart' {
			if ([string]::IsNullOrWhiteSpace($Path)) {
				@("$env:HOME/.config/autostart")
			} else {
				@($Path)
			}
		}
		'all' { @('~/.local/share/applications','/usr/share/applications',"$env:HOME/.config/autostart") }
	}
	$result = @()
	foreach ($entryPath in $paths) {
		if (-not (Test-Path -Path $entryPath)) {
			continue
		}
		$items = Get-ChildItem -Path $entryPath -Filter $Filter -File -ErrorAction SilentlyContinue
		foreach ($item in $items) {
			if (-not [string]::IsNullOrWhiteSpace($Name)) {
				if ($item.BaseName -notlike "*$Name*" -and $item.Name -notlike "*$Name*") {
					continue
				}
			}
			if ($Contents) {
				$result += [pscustomobject]@{
					Name        = $item.Name
					BaseName    = $item.BaseName
					FullName    = $item.FullName
					Location    = $Location
					SourcePath  = $entryPath
					Content     = (Get-Content -Path $item.FullName -Raw)
				}
			} else {
				$result += [pscustomobject]@{
					Name        = $item.Name
					BaseName    = $item.BaseName
					FullName    = $item.FullName
					Location    = $Location
					SourcePath  = $entryPath
				}
			}
		}
	}
	$result
}