function Get-FlatpakInventory {
	param()
	try {
		$flatpaks = flatpak list --columns=name,version,application,description,installation,size
		$flatpaks | ForEach-Object {
			$pkg = $_.Split("`t") | Where-Object {![string]::IsNullOrEmpty($_)}
			[pscustomobject]@{
				Name            = $pkg[0]
				Version         = $pkg[1]
				AppId           = $pkg[2]
				Description     = $pkg[3]
				InstallLocation = $pkg[4]
				Size            = $pkg[5]
			}
		}
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}