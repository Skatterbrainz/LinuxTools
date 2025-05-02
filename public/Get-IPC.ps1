function Get-IPC {
    <#
    .SYNOPSIS
        Get IPC information
    .DESCRIPTION
    .PARAMETER name
    .EXAMPLE
        Get-IPC

        Returns current IPC information
    .EXAMPLE
    .LINK
        https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-IPC.md
    #>
    [CmdletBinding()]
    param()
    try {
        if (!(Test-Path -Path '/usr/bin/lsipc')) {
            throw "File not found: lsipc"
        }
        lsipc --json | ConvertFrom-Json | Select-Object -ExpandProperty ipclimits
    } catch {
        Write-Error $_.Exception.Message
    }
}