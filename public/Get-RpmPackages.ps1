function Get-RpmPackages {
	<#
	.SYNOPSIS
	Retrieves a list of installed RPM packages.

	.DESCRIPTION
	This function queries the system for installed RPM packages and returns their details.

	.PARAMETER Name
	Optional. The name of the package to filter by.

	.EXAMPLE
	Get-RpmPackages
	Retrieves all installed RPM packages.

	.EXAMPLE
	Get-RpmPackages -Name "bash"
	Retrieves the installed RPM package with the name "bash".
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$false)][string]$Name
	)
	if (-not (Get-Command 'rpm' -ErrorAction SilentlyContinue)) {
		throw "Required command not found: rpm"
	}
	$query = 'rpm -qa --queryformat "%{NAME} %{VERSION}-%{RELEASE} %{ARCH}\n"'
	if ($Name) {
		$query += " | grep $Name"
	}
	$packages = Invoke-Expression $query
	foreach ($pkg in $packages) {
		$parts = $pkg.Split(' ')
		[pscustomobject]@{
			Name    = $parts[0]
			Version = $parts[1]
			Arch    = $parts[2]
		}
	}
}