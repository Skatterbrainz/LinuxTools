function Get-SnapInventory {
	param()
	try {
		write-host "Listing snaps..."
		$snaps = snap list --all
		$snaps | ForEach-Object {
			$pkg = $_.Split(" ") | Where-Object {![string]::IsNullOrEmpty($_)}
			[pscustomobject]@{
				Name            = $pkg[0]
				Version         = $pkg[1]
				Rev             = $pkg[2]
				Tracking        = $pkg[3]
				Publisher       = $pkg[4]
				Notes           = $pkg[5]
			}
		}
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}
