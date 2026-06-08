BeforeAll {
	$repoRoot = Split-Path -Path $PSScriptRoot -Parent
	$manifestPath = Join-Path -Path $repoRoot -ChildPath 'linuxtools.psd1'
	Import-Module $manifestPath -Force
}

Describe 'Runtime smoke tests (non-destructive)' {
	It 'Get-PackageUpdates -Summary returns objects or empty set' {
		$result = @(Get-PackageUpdates -Summary)
		$result | Should -Not -BeNull
		if ($result.Count -gt 0) {
			$result[0].PSObject.Properties.Name | Should -Contain 'SourceType'
			$result[0].PSObject.Properties.Name | Should -Contain 'UpdateCount'
		}
	}

	It 'Get-NetworkConnections -ListeningOnly returns schema when data exists' {
		$result = @(Get-NetworkConnections -ListeningOnly)
		$result | Should -Not -BeNull
		if ($result.Count -gt 0) {
			$result[0].PSObject.Properties.Name | Should -Contain 'SourceType'
			$result[0].PSObject.Properties.Name | Should -Contain 'Local'
		}
	}

	It 'Get-AptSources returns schema when apt sources exist' {
		$result = @(Get-AptSources)
		$result | Should -Not -BeNull
		if ($result.Count -gt 0) {
			$result[0].PSObject.Properties.Name | Should -Contain 'SourceType'
			$result[0].PSObject.Properties.Name | Should -Contain 'EntryType'
		}
	}

	It 'Get-SystemErrors returns schema for journal source' {
		$result = @(Get-SystemErrors -Source journal -Since '-2h' -Lines 20)
		$result | Should -Not -BeNull
		if ($result.Count -gt 0) {
			$result[0].PSObject.Properties.Name | Should -Contain 'SourceType'
			$result[0].PSObject.Properties.Name | Should -Contain 'Entry'
		}
	}

	It 'Test-SystemHealth returns score and status' {
		$result = Test-SystemHealth
		$result | Should -Not -BeNullOrEmpty
		$result.PSObject.Properties.Name | Should -Contain 'HealthScore'
		$result.PSObject.Properties.Name | Should -Contain 'Status'
		$result.PSObject.Properties.Name | Should -Contain 'MaxDiskPercent'
		$result.PSObject.Properties.Name | Should -Contain 'FailedServices'
		$result.PSObject.Properties.Name | Should -Contain 'PendingUpdates'
		$result.PSObject.Properties.Name | Should -Contain 'RebootPending'
	}
}