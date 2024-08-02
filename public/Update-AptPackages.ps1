function Update-AptPackages {
	param()
	try {
		write-host "Updating apt cache..."
		sudo apt update
		write-host "Upgrading packages..."
		sudo apt upgrade -y
	} catch {
		Write-Error $($_.Exception.Message -join(";"))
	}
}
