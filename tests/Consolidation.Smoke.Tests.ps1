BeforeAll {
	$repoRoot = Split-Path -Path $PSScriptRoot -Parent
	$manifestPath = Join-Path -Path $repoRoot -ChildPath 'linuxtools.psd1'
	Import-Module $manifestPath -Force
}

Describe 'Consolidated command surface' {
	It 'exports the consolidated commands' {
		$commands = @(
			'Get-LinuxPackages',
			'Update-LinuxPackages',
			'Get-PackageUpdates',
			'Get-CinnamonSpices',
			'Get-SystemInfo',
			'Get-DefaultApplication',
			'Get-DesktopEntries',
			'Get-SystemErrors',
			'Test-SystemHealth'
		)
		foreach ($name in $commands) {
			(Get-Command -Name $name -ErrorAction SilentlyContinue) | Should -Not -BeNullOrEmpty
		}
	}

	It 'Get-SystemInfo exposes Detail and NeoFetch parameters' {
		$cmd = Get-Command -Name 'Get-SystemInfo' -ErrorAction Stop
		$cmd.Parameters.ContainsKey('Detail') | Should -BeTrue
		$cmd.Parameters.ContainsKey('NeoFetch') | Should -BeTrue
	}

	It 'Get-CinnamonSpices exposes Type parameter' {
		$cmd = Get-Command -Name 'Get-CinnamonSpices' -ErrorAction Stop
		$cmd.Parameters.ContainsKey('Type') | Should -BeTrue
	}

	It 'Get-DefaultApplication returns structured rows when mimeapps exists' {
		$mimePath = Join-Path -Path $HOME -ChildPath '.config/mimeapps.list'
		if (-not (Test-Path -Path $mimePath)) {
			Set-ItResult -Skipped -Because 'mimeapps.list not found on this host'
			return
		}
		$result = @(Get-DefaultApplication -Category browser)
		if ($result.Count -gt 0) {
			$result[0].PSObject.Properties.Name | Should -Contain 'MimeType'
			$result[0].PSObject.Properties.Name | Should -Contain 'DesktopEntry'
		}
	}

	It 'Get-DesktopEntries returns objects for user location' {
		$result = @(Get-DesktopEntries -Location User)
		if ($result.Count -gt 0) {
			$result[0].PSObject.Properties.Name | Should -Contain 'BaseName'
			$result[0].PSObject.Properties.Name | Should -Contain 'FullName'
		}
	}
}