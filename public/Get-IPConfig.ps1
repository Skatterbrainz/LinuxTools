function Get-IPConfig {
	<#
	.SYNOPSIS
        Get TCP/IP configuration
	.DESCRIPTION
        Get TCP/IP configuration and basic settings
	.PARAMETER none
	.EXAMPLE
        Get-IPConfig
        
        Returns IP configuration information
	.LINK
        https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-IPConfig.md
	#>
    [CmdletBinding()]
    param ()
    try {
        if (!(Test-Path -Path '/usr/sbin/ip')) {
            throw "File not found: ip"
        }
        ip -j address | ConvertFrom-Json
    } catch {
        Write-Error $_.Exception.Message
    }
}