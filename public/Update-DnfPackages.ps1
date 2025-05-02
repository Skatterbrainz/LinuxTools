function Update-DnfPackages {
    <#
    #>
    [CmdletBinding()]
    param()
    try {
        if (!(Test-Path -Path '/usr/bin/dnf')) {
            throw "File not found: dnf"
        }
        if (Test-Path -Path '/usr/bin/dnf') {
            $pkgs = dnf list --installed
            foreach ($row in $pkgs[1..$($pkgs.Count-1)]) {
                $items = $row.Split(' ') | Where-Object {![string]::IsNullOrWhiteSpace($_)}
                [pscustomobject]@{
                    Name    = $items[0]
                    Version = $items[1]
                    Source  = $items[2]
                }
            }
        }
    } catch {
        Write-Error $_.Exception.Message
    }
}