function Get-IRQ {
	<#
	.SYNOPSIS
		Get IRQ interrupts
	.DESCRIPTION
		Get IRQ interrupts and basic configuration settings
	.PARAMETER Id
		Interrupt ID to search for. If not specified, all interrupts are returned.
	.EXAMPLE
		Get-IRQ

		Returns current IRQ information
	.EXAMPLE
		Get-IRQ -Id 1

		Returns only the IRQ with ID 1
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