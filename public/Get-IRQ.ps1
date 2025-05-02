function Get-IRQ {
	<#
	.SYNOPSIS
		Get IRQ interrupts
	.DESCRIPTION
	.PARAMETER name
	.EXAMPLE
		Get-IRQ

		Returns current IRQ information
	.EXAMPLE
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-IRQ.md
	#>
	[CmdletBinding()]
	param(
		[parameter()]$Id
	)
	try {
		if (!(Test-Path -Path '/usr/bin/lsirq')) {
			throw "File not found: lsirq"
		}
		if (![string]::IsNullOrEmpty($Id)) {
			lsirq --json | ConvertFrom-Json | Select-Object -ExpandProperty interrupts | Where-Object {$_.irq -eq $Id}
		} else {
			lsirq --json | ConvertFrom-Json | Select-Object -ExpandProperty interrupts
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}