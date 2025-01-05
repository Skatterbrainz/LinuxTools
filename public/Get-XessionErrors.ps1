function Get-XsessionErrors {
    <#
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