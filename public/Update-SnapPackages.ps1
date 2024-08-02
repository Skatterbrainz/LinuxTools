function Update-SnapPackages {
	param()
	try {
		write-host "Updating snap packages..."
		sudo snap refresh
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}