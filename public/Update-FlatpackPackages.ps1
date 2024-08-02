function Update-FlatpakPackages {
	param()
	try {
		write-host "Updating flatpak packages..."
		flatpak update -y
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}