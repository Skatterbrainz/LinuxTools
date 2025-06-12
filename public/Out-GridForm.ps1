function Out-GridForm {
	<#
	.SYNOPSIS
		Generates a YAD grid form dialog from a collection of objects.
	.DESCRIPTION
		Creates a YAD grid form dialog that allows users to select items from a list of objects.
	.PARAMETER Data
		A collection of objects to display in the grid. Each object should have properties that will be used as columns in the grid.
	.PARAMETER Title
		The title of the YAD dialog window. Defaults to "Grid Form".
	.PARAMETER Text
		The text to display in the YAD dialog, prompting the user to make a selection. Defaults to "Select items".
	.PARAMETER Width
		The width of the YAD dialog window in pixels. Defaults to 600.
	.PARAMETER Height
		The height of the YAD dialog window in pixels. Defaults to 400.
	.PARAMETER Separator
		The separator used to join multiple selections when the dialog allows multiple selections. Defaults to "|".
	.PARAMETER FontName
		The font name to use in the YAD dialog. If not specified, the default system font will be used.
	.PARAMETER IconPath
		The path to the icon to display in the YAD dialog. Defaults to 'dialog-information'.
	.PARAMETER ImagePath
		The path to the image to display in the YAD dialog. Defaults to 'dialog-question'.
	.PARAMETER ButtonsLayout
		The layout of the buttons in the YAD dialog. Defaults to 'center'. Valid values are 'center', 'edge', 'end', 'spread', and 'start'.
	.EXAMPLE
		$files = Get-ChildItem -Path "C:\MyFiles" | Select-Object Name, Length, LastWriteTime
		$selected = $files | Out-GridForm -Title "File List" -Text "Select files to process" -Width 800 -Height 600
		
		This example creates a YAD grid form dialog displaying a list of files in a specified directory, allowing the user to select one or more files for further processing.
	.EXAMPLE
		$data = @(
			[pscustomobject]@{ ID = 1; Name = "Alice"; Email = "alice@contoso.com" }
			[pscustomobject]@{ ID = 2; Name = "Bob"; Email = "bob@contoso.com" }
		)
		$selected = $data | Out-GridForm -Title "User Table" -Text "Select users" -Width 600 -Height 400

		This example creates a YAD grid form dialog displaying a table of users with their IDs, names, and emails. The user can select one or more users from the list.
	.NOTES
		This function requires YAD (Yet Another Dialog) to be installed on the system. It is typically used in Linux environments where YAD is available.
		To play with this directly, type 'yad --help' in a terminal.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Out-GridForm.md
	#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[psobject[]]$Data,
		[parameter(Mandatory = $false)][string]$Title = "Grid Form",
		[parameter(Mandatory = $false)][string]$Text = "Select items",
		[parameter(Mandatory = $false)][int]$Width = 600,
		[parameter(Mandatory = $false)][int]$Height = 400,
		[parameter(Mandatory = $false)][string]$Separator = "|",
		[parameter(Mandatory = $false)][string]$FontName,
		[parameter(Mandatory = $false)][string]$IconPath = 'dialog-information',
		[parameter(Mandatory = $false)][string]$ImagePath = 'dialog-question',
		[parameter(Mandatory = $false)][string]
		[ValidateSet('center','edge','end','spread','start')]$ButtonsLayout = 'center'
	)

	begin {
		$inputData = @()
		if (!(Test-Path -Path "/usr/bin/yad")) {
			throw "YAD is not installed or not found in /usr/bin"
		}
	}
	process {
		if ($null -ne $Data) {
			$inputData += $Data
		}
	}
	end {
		if (-not $inputData -or $inputData.Count -eq 0) { 
			throw "No data provided or data is empty."
		}

		$Fields = $inputData[0].psobject.properties.Name
		$Columns = @("--column=Select:CHK") + ($Fields | ForEach-Object { "--column=$_" })
		$cmd = @(
			"yad", "--list", "--width=$Width", "--height=$Height",
			"--title='$Title'", "--text='$Text'",
			"--separator='$Separator'", 
			"--center", "--always-print-result",
			"--multiple", "--checklist",
			"--buttons-layout='$ButtonsLayout'"
		)
		if ($FontName) {
			$cmd += "--fontname='$FontName'"
		}
		if ($IconPath) {
			$cmd += "--window-icon='$IconPath'"
		}
		if ($ImagePath) {
			$cmd += "--image='$ImagePath'"
		}
		$cmd += $Columns
		foreach ($row in $inputData) {
			$line = @("FALSE")
			foreach ($field in $Fields) {
				$value = "$($row.$field)" -replace "'", "''"
				$line += "'$value'"
			}
			$cmd += $line
		}

		$yadCmd = $cmd -join ' '
		Write-Verbose "YAD Command: $yadCmd"

		$rawOutput = bash -c "$yadCmd"

		if ($rawOutput) {
			$results = @()
			foreach ($line in $rawOutput -split "`n") {
				Write-Verbose "line: $line"
				$row = ($line -split [regex]::Escape($Separator))[1..-1]
				Write-Verbose "key: $($row[0])"
				$results += $inputData | Where-Object { $_.$($Fields[0]) -eq $row[0] }
			}
			$results
		}
	}
}