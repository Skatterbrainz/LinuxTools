function Get-Keyring {
    <#
    .SYNOPSIS
    Gets the Linux keyrings from the system.

    .DESCRIPTION
    This function retrieves the GPG keyrings located in '/etc/apt/trusted.gpg.d/'.

    .PARAMETER Name
    Optional. Filters the keyrings by name.

    .EXAMPLE
    Get-Keyring

    Retrieves all keyrings.

    .EXAMPLE
    Get-Keyring -Name 'microsoft'

    Retrieves keyrings with names matching 'microsoft'.
    #>
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$false)][string]$Name
    )
    try {
        # get linux keyrings
        $keyrings = Get-ChildItem -Path '/etc/apt/trusted.gpg.d/' -File -Filter '*.gpg' -ErrorAction SilentlyContinue
        if (-not [string]::IsNullOrWhiteSpace($Name)) {
            $keyrings = $keyrings | Where-Object { $_.Name -like "*$Name*" }
        }
        $keyrings
    } catch {
        Write-Error "Failed to get keyrings: $($_.Exception.Message)"
    }
}