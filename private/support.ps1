# add helper functions here
function getGridSelect {
	<#
	.SYNOPSIS
		Display a grid view of the specified data set and return the selected item(s)
	.DESCRIPTION
		Display a grid view of the specified data set and return the selected item(s)
	.PARAMETER DataSet
		Specify the data set (array, arraylist, collection) to display in the grid view
	.PARAMETER Title
		Specify the title of the grid view window
	.PARAMETER OutputMode
		Specify the output mode: Single or Multiple. Default is Multiple
	.EXAMPLE
		getGridSelect -DataSet $users -Title "Select a User Account" -OutputMode Single
		Display a grid view of the specified data set and return the selected item
	.EXAMPLE
		getGridSelect -DataSet $users -Title "Select User Accounts"
		Display a grid view of the specified data set and return the selected item(s)
	#>
	param (
		[parameter(Mandatory=$True)]$DataSet,
		[parameter(Mandatory=$True)][string]$Title,
		[parameter(Mandatory=$False)][string][ValidateSet('Single','Multiple')]$OutputMode = 'Multiple'
	)
	if (Get-Module Microsoft.PowerShell.ConsoleGuiTools -ListAvailable) {
		@($DataSet | Out-ConsoleGridView -Title $Title -OutputMode $OutputMode)
	} else {
		Write-Warning "Linux platforms require module: microsoft.powershell.consoleguitools"
	}
}

function IsCinnamonInstalled {
	<#
	.SYNOPSIS
		Determine if Cinnamon desktop is installed
	.DESCRIPTION
		Determine if Cinnamon desktop is installed
	#>
	param()
	$desktop = Get-ChildItem -Path "/usr/share/xsessions" -Filter "cinnamon.desktop" -ErrorAction SilentlyContinue
	if ($desktop) {
		Write-Output $true
		$global:IsCinnamon = $true
	} else {
		Write-Output $false
		$global:IsCinnamon = $false
	}
}

function Get-LogFile {
    param()
    Get-Content -Path $global:LogFilePath -ErrorAction SilentlyContinue
}
