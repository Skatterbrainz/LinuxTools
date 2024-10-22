function Get-UbuntuAdjustments {
	<#
	.SYNOPSIS
		Retrieves a list of Ubuntu system adjustments
	.DESCRIPTION
		Retrieves a list of Ubuntu system adjustments from the mimeapps.list file
	.EXAMPLE
		Get-UbuntuAdjustments
		Retrieves a list of Ubuntu system adjustments
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-UbuntuAdjustments.md
	#>
	param()
	if (Test-Path -Path '/usr/share/ubuntu-system-adjustments/mimeapps.list') {
		$result = @()
		Get-Content -Path '/usr/share/ubuntu-system-adjustments/mimeapps.list' |
			Where-Object {![string]::IsNullOrEmpty($_)} |
			ForEach-Object {
				$line = $_.Split("=")
				$result += @{
					$line[0] = $line[1]
				}
			}
		[pscustomobject]$result
	}
}