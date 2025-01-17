function Get-XsessionErrors {
    <#
    .SYNOPSIS
        Get the contents of the ~/.xsession-errors file
    .DESCRIPTION
        Get the contents of the ~/.xsession-errors file, which is a common location for error messages in Linux desktop environments.
    .PARAMETER logPath
        The path to the log file to be read. Default is "~/.xsession-errors".
    .EXAMPLE
        Get-XsessionErrors
        Returns the contents of the ~/.xsession-errors file.
    .LINK
        https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-XsessionErrors.md
    #>
    [CmdletBinding()]
    param (
        [parameter()][string]$logPath = "~/.xsession-errors"
    )
    if (-not (Test-Path -Path $logPath)) {
        Write-Warning "Log file not found: $logPath"
        return
    }
    $errors = Get-Content -Path $logPath -ErrorAction SilentlyContinue
    if (-not $errors) {
        Write-Warning "No errors found in log file: $logPath"
    } else {
        $errors
    }
}