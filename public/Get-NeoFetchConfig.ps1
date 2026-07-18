function Get-NeoFetchConfig {
    <#
    .SYNOPSIS
    Gets the NeoFetch configuration items and their enabled status.

    .DESCRIPTION
    This function reads the NeoFetch configuration file located at ~/.config/neofetch/config.conf
    and returns a list of configuration items with their enabled status.
    #>
    param()
    try {
        $filepath = '~/.config/neofetch/config.conf'
        if (Test-Path -Path $filepath) {
            # read file for rows starting with "info " or "# info " 
            Get-Content -Path $filepath -ErrorAction Stop |
                Foreach-Object { "$($_)".Trim() } |
                    Where-Object { $_ -match '^(?:# )?info' } |
                        ForEach-Object {
                            $name = $null
                            $enabled = $false
                            if ($_.StartsWith('info')) {
                                $name = $_.Split(' ')[1] -replace "`"", ""
                                $enabled = $true
                            }
                            elseif ($_.StartsWith('#')) {
                                $name = $_.Split(' ')[2] -replace "`"", ""
                                $enabled = $false
                            }
                            if ($name) {
                                [PSCustomObject]@{
                                    Name = $name
                                    Enabled = $enabled
                                }
                            }
                        }
        } else {
            Write-Error "NeoFetch config file not found at $filepath"
        }
    } catch {
        Write-Error "Failed to get NeoFetch config: $($_.Exception.Message)"
    }
}