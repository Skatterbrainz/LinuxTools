function Update-AllPackages {
	param()
	try {
		Update-AptPackages
		Update-FlatpakPackages
		Update-SnapPackages
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}