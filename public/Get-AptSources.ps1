function Get-AptSources {
	<#
	.SYNOPSIS
		Gets configured APT repository sources.
	.DESCRIPTION
		Parses sources.list and sources.list.d entries and returns active repository lines.
	.EXAMPLE
		Get-AptSources
		Returns configured apt source entries.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AptSources.md
	#>
	[CmdletBinding()]
	param()
	try {
		$targets = @('/etc/apt/sources.list')
		if (Test-Path -Path '/etc/apt/sources.list.d') {
			$targets += @(Get-ChildItem -Path '/etc/apt/sources.list.d' -File -Filter '*.list' | Select-Object -ExpandProperty FullName)
		}
		foreach ($file in $targets) {
			if (-not (Test-Path -Path $file)) {
				continue
			}
			$lineNumber = 0
			foreach ($line in Get-Content -Path $file) {
				$lineNumber++
				$trimmed = $line.Trim()
				if ([string]::IsNullOrWhiteSpace($trimmed) -or $trimmed.StartsWith('#')) {
					continue
				}
				if ($trimmed -match '^(deb|deb-src)\s+') {
					[pscustomobject]@{
						SourceType = 'apt'
						File       = $file
						LineNumber = $lineNumber
						EntryType  = if ($trimmed.StartsWith('deb-src')) { 'deb-src' } else { 'deb' }
						Entry      = $trimmed
					}
				}
			}
		}
	} catch {
		Write-Error $($_.Exception.Message -join(';'))
	}
}