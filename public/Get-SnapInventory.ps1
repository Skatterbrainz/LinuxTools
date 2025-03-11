function Get-SnapInventory {
	<#
	.SYNOPSIS
		Collects inventory of installed snap packages.
	.DESCRIPTION
		Collects inventory of installed snap packages.
	.PARAMETER (none)
		No parameters
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-SnapInventory.md
	#>
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
