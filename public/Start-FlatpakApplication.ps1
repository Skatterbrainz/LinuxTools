function Start-FlatpakApplication {
	<#
	.SYNOPSIS
		Starts a Flatpak application by name or Application ID.
	.DESCRIPTION
		This function allows you to start a Flatpak application installed on your system.
		It can accept either the application name or the Application ID as parameters.
		If neither parameter is provided, it will prompt you to select an application from a list.
	.PARAMETER Name
		The name of the Flatpak application to start.
	.PARAMETER ApplicationID
		The Application ID of the Flatpak application to start.
	.EXAMPLE
		Start-FlatpakApplication -Name "GIMP"
		Starts the Flatpak application with the name "GIMP".
	.EXAMPLE
		Start-FlatpakApplication -ApplicationID "org.gimp.GIMP"
		Starts the Flatpak application with the Application ID "org.gimp.GIMP".
	.EXAMPLE
		Start-FlatpakApplication
		Prompts the user to select a Flatpak application from a list to start.
	.NOTES
		Requires Flatpak to be installed on the system.
	#>
	param (
		[parameter(Mandatory = $false)]
		[string]$Name,
		[Parameter(Mandatory = $false)]
		[string]$ApplicationID
	)
	# Check if Flatpak is installed
	if (-not (Get-Command flatpak -ErrorAction SilentlyContinue)) {
		Write-Error "Flatpak is not installed on this system."
		return
	}
	# Get the list of installed Flatpak applications
	$apps = Invoke-Command -ScriptBlock { flatpak list --app --columns=application,name }
	$applist = $apps | ForEach-Object {
		$parts = $_.Split("`t", [System.StringSplitOptions]::RemoveEmptyEntries)
		[PSCustomObject]@{
			Name          = $parts[1].Trim()
			ApplicationID = $parts[0].Trim()
		}
	}
	if ([string]::IsNullOrEmpty($ApplicationID) -and [string]::IsNullOrEmpty($Name)) {
		$app = Out-GridSelect -InputObject $applist -Title "Select a Flatpak Application to Start"
	} elseif (-not [string]::IsNullOrEmpty($Name)) {
		$app = $applist | Where-Object { $_.Name -ieq $Name } | Select-Object -First 1
		if (-not $app) {
			Write-Error "No Flatpak application found with the name '$Name'."
			return
		}
	} elseif (-not [string]::IsNullOrEmpty($ApplicationID)) {
		$app = $applist | Where-Object { $_.ApplicationID -ieq $ApplicationID } | Select-Object -First 1
		if (-not $app) {
			Write-Error "No Flatpak application found with the Application ID '$ApplicationID'."
			return
		}
	} else {
		$app = $null
	}

	# Start the Flatpak application
	try {
		Write-Output "Starting Flatpak application: $($app.ApplicationID)"
		Invoke-Command -ScriptBlock { flatpak run $app.ApplicationID } -ErrorAction Stop
	} catch {
		Write-Error "Failed to start Flatpak application: $($app.ApplicationID). Error: $_"
	}
}