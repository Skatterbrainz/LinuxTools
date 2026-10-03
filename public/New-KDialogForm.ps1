<#
password:
$password = $(kdialog --password "Enter your password:")

inputbox:
$input = $(kdialog --inputbox "Enter some text:" "Default value")

combobox:
$choice = $(kdialog --combobox "Select color:" "Red" "Blue" "Green" "Yellow")

checklist:
$choices = $(kdialog --checklist "Select colors:" 1 "Red" off 2 "Blue" off 3 "Green" on 4 "Yellow" on)

radiolist:
$radioChoice = $(kdialog --radiolist "Select a color:" 1 "Red" off 2 "Blue" off 3 "Green" on 4 "Yellow" off)

selectfile:
$file = $(kdialog --getopenfilename "Path" "*.txt *.csv")

savefile:
$saveFile = $(kdialog --getsavefilename "Path" "*.txt *.csv")

selectfolder:
$folder = $(kdialog --getexistingdirectory "Path")

openfile:
$openFile = $(kdialog --getopenfilename "Path" "*.txt *.csv")

menu:
$menuChoice = $(kdialog --menu "Select an option:" 1 "Option 1" 2 "Option 2" 3 "Option 3")
#>
function New-KDialogForm {
	<#
	.SYNOPSIS
	Creates a KDialog form of the specified type.

	.DESCRIPTION
	This function allows you to create various types of KDialog forms, including password prompts, message boxes, input boxes, combo boxes, checklists, radio lists, file selectors, folder selectors, and menus.

	.PARAMETER Title
	The title of the KDialog form.

	.PARAMETER Message
	The message to display in the KDialog form.

	.PARAMETER FormType
	The type of KDialog form to create. Valid values are "password", "msgbox", "inputbox", 
	"combobox", "checklist", "radiolist", "selectfile", "savefile", "selectfolder", "openfile", 
	"error" and "menu".

	.PARAMETER InputValues
	An array of input values for combo boxes, checklists, radio lists, and menus.

	.PARAMETER DefaultValues
	An array of default values for combo boxes, checklists, radio lists, and menus.
	Also applies to inputbox where the first item in the list is used as the default value.

	.EXAMPLE
	$password = New-KDialogForm -Message "Enter password:" -FormType password
	Returns a string containing the user's input from the KDialog form. The value is a SecureString.

	.EXAMPLE
	$input = New-KDialogForm -Message "Enter some text:" -FormType inputbox
	Returns a string containing the user's input from the KDialog form.

	.EXAMPLE
	$selection = New-KDialogForm -Message "Select an option:" -FormType menu -InputValues @("Option 1", "Option 2", "Option 3")
	Returns a string containing the user's selection from the KDialog form.

	.EXAMPLE
	$selection = New-KDialogForm -Message "Select an option:" -FormType menu -InputValues @("Option 1", "Option 2", "Option 3") -DefaultValues @("Option 2", "Option 3")
	Returns a string containing the user's selection from the KDialog form based on the default values provided.

	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-KDialogForm.md
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory=$false)]
		[string]$Title = "KDialog Form",
		[parameter(Mandatory=$false)]
		[string]$Message = "Message",
		[parameter(Mandatory=$false)]
		[string][ValidateSet("password", "msgbox", "inputbox", "combobox", "checklist", "radiolist", "selectfile", "savefile", "selectfolder", "openfile", "error", "menu")]$FormType = "msgbox",
		[parameter(Mandatory=$false)]$InputValues,
		[parameter(Mandatory=$false)]$DefaultValues
	)
	if (!(Get-Command -Name "kdialog" -ErrorAction SilentlyContinue)) {
		throw "KDialog is not installed or not available in the system path."
	}
	$cmdString = "kdialog"
	if ($InputValues) {
		$listValues = (Convert-ToNumberedArray -Values $InputValues -DefaultValues $DefaultValues)
		$listValueArgs = $listValues | ForEach-Object { $_ -join ' ' }
	}
	if ($FormType -eq "password") {
		$cmdString += " --password `"$Message`""
	}
	elseif ($FormType -eq "msgbox") {
		$cmdString += " --msgbox `"$Message`""
	}
	elseif ($FormType -eq "error") {
		$cmdString += " --error `"$Message`""
	}
	elseif ($FormType -eq "inputbox") {
		$cmdString += " --inputbox `"$Message`""
		if ($DefaultValues -and $DefaultValues.Count -gt 0) {
			$cmdString += " `"$($DefaultValues[0])`""
		}
	}
	elseif ($FormType -eq "combobox") {
		$cmdString += " --combobox `"$Message`""
		if ($InputValues) {
			$cmdString += " " + ($listValueArgs -join " ")
		}
	}
	elseif ($FormType -eq "checklist") {
		$cmdString += " --checklist `"$Message`""
		if ($InputValues) {
			$cmdString += " " + ($listValueArgs -join " ")
		}
	}
	elseif ($FormType -eq "radiolist") {
		$cmdString += " --radiolist `"$Message`""
		if ($InputValues) {
			$cmdString += " " + ($listValueArgs -join " ")
		}
	}
	elseif ($FormType -eq "menu") {
		$cmdString += " --menu `"$Message`""
		if ($InputValues) {
			$cmdString += " " + ($listValueArgs -join " ")
		}
	}
	elseif ($FormType -eq "selectfile") {
		$cmdString += " --getopenfilename `"$Message`""
	}
	elseif ($FormType -eq "savefile") {
		$cmdString += " --getsavefilename `"$Message`""
	}
	elseif ($FormType -eq "selectfolder") {
		$cmdString += " --getexistingdirectory `"$Message`""
	}
	elseif ($FormType -eq "openfile") {
		$cmdString += " --getopenfilename `"$Message`""
	}
	else {
		throw "Unsupported dialog type: $FormType"
	}
	Write-Verbose "command: $cmdString"
	$response = Invoke-Expression $cmdString
	if ($FormType -eq 'password') {
		$response | ConvertTo-SecureString -AsPlainText -Force
	} elseif ($FormType -in ('combobox', 'checklist', 'radiolist', 'menu')) {
		$selectedIds = @(
			$response |
			ForEach-Object { $_ -split '[,\s|]+' } |
			ForEach-Object { $_.Trim('"') } |
			Where-Object { $_ }
		)
		Write-Verbose "input list: $((@($listValues | ForEach-Object { $_ -join ':' }) -join ', '))"
		Write-Verbose "selected ids: $($selectedIds -join ', ')"
		$result = $listValues |
			Where-Object { $_[0] -in $selectedIds } |
			ForEach-Object { $_[1] }
		$result
	} else {
		$response
	}
}

# function to convert an array of values into a modified array with numbered indexing
# ("value1", "value2", "value3") -> (("1" "value1" "off"), ("2" "value2" "off"), ("3" "value3" "off"))
function Convert-ToNumberedArray {
	param(
		[parameter(Mandatory=$true)]
		[string[]]$Values,
		[parameter(Mandatory=$false)]
		[string[]]$DefaultValues
	)
	$numberedArray = @()
	$defaultLookup = @{}
	if ($DefaultValues) {
		foreach ($defaultValue in $DefaultValues) {
			$defaultLookup[$defaultValue] = $true
		}
	}
	for ($i = 0; $i -lt $Values.Length; $i++) {
		$numberedArray += ,@(
			($i + 1).ToString()
			$Values[$i]
			if ($defaultLookup.ContainsKey($Values[$i])) {
				'on'
			} else {
				'off'
			}
		)
	}
	return $numberedArray
}