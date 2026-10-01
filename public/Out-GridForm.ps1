function Out-GridForm {
	<#
	.SYNOPSIS
		Displays a grid form for selecting objects from the pipeline.

	.DESCRIPTION
		Out-GridForm presents the input objects in a sortable, selectable grid using a PyQt5 dialog.

	.PARAMETER InputObject
		The objects to display in the grid.

	.PARAMETER Title
		The title of the grid form window.

	.PARAMETER OutputMode
		Specifies whether a single or multiple rows can be selected. Valid values are 'Single' and 'Multiple'.

	.PARAMETER NumSortColumn
		An array of column names that should be sorted numerically.
		If omitted, columns are sorted lexicographically, example "9" > "10".

	.EXAMPLE
		Get-Process | Out-GridForm -Title "Select Processes" -OutputMode Multiple

		Displays a grid form with the processes, allowing multiple selection.
	
	.EXAMPLE
		Get-Process | Out-GridForm -Title "Select Process" -OutputMode Single

		Displays a grid form with the processes, allowing a single selection.
	
	.EXAMPLE
		Get-Process | Out-GridForm -Title "Select Processes" -OutputMode Multiple -NumSortColumn "CPU"

		Displays a grid form with the processes, allowing multiple selection, and sorts the "CPU" column numerically.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Out-GridForm.md
	.NOTES
		This function requires PyQt5 to be installed.
		Ensure that you have the necessary permissions to run this command.
		Use with caution, as it will display and potentially allow selection of sensitive data.
	#>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline=$true, Mandatory=$true)]
        [PSObject[]]$InputObject,
        [string]$Title = "Grid Form",
        [ValidateSet('Single','Multiple')]
        [string]$OutputMode = 'Single',
        [string[]]$NumSortColumn = @()
    )

    begin { $objects = @() }
    process { $objects += $InputObject }
    end {
        if ($objects.Count -eq 0) { return }

        $properties = $objects[0].PSObject.Properties.Name

        $rows = $objects | ForEach-Object {
            $obj = [PSCustomObject]@{}
            foreach ($p in $properties) {
                $obj | Add-Member -NotePropertyName $p -NotePropertyValue ([string]$($_.$p))
            }
            $obj
        }

        $json = ([PSCustomObject]@{
            columns      = $properties
            title        = $Title
            rows         = $rows
            outputMode   = $OutputMode
            numSortCols  = $NumSortColumn
        }) | ConvertTo-Json -Depth 5

        $pyPath   = [System.IO.Path]::GetTempFileName()
        $dataPath = [System.IO.Path]::GetTempFileName()

        $pyScript = @'
import sys, json
from PyQt5.QtCore import Qt
from PyQt5.QtWidgets import (QApplication, QTableWidget, QTableWidgetItem,
                             QDialog, QDialogButtonBox, QVBoxLayout,
                             QHeaderView)

with open(sys.argv[1], 'r') as f:
    data = json.load(f)

cols = data['columns']
rows = data['rows']
mode = data.get('outputMode', 'Single')
num_cols = set(data.get('numSortCols', []))

app = QApplication(sys.argv)
dlg = QDialog()
dlg.setWindowTitle(data.get('title', 'Grid'))
dlg.resize(900, 500)

table = QTableWidget(len(rows), len(cols))
table.setHorizontalHeaderLabels(cols)
table.setEditTriggers(QTableWidget.NoEditTriggers)
table.setSelectionBehavior(QTableWidget.SelectRows)

if mode == 'Multiple':
    table.setSelectionMode(QTableWidget.ExtendedSelection)
else:
    table.setSelectionMode(QTableWidget.SingleSelection)

# Populate data
for r, row in enumerate(rows):
    for c, col in enumerate(cols):
        text = str(row.get(col, ''))
        item = QTableWidgetItem(text)
        table.setItem(r, c, item)
        # Set numeric sort key for designated columns
        if col in num_cols:
            try:
                item.setData(Qt.UserRole, float(text))
            except ValueError:
                pass  # non-numeric value; will sort last

# Enable sorting AFTER data is in place
table.setSortingEnabled(True)
table.horizontalHeader().setSectionResizeMode(QHeaderView.ResizeToContents)

buttons = QDialogButtonBox(QDialogButtonBox.Ok | QDialogButtonBox.Cancel)
buttons.accepted.connect(dlg.accept)
buttons.rejected.connect(dlg.reject)

layout = QVBoxLayout()
layout.addWidget(table)
layout.addWidget(buttons)
dlg.setLayout(layout)

if dlg.exec_() == QDialog.Accepted:
    selected = sorted(set(table.selectionModel().selectedRows()))
    result = []
    for idx in selected:
        row_data = {}
        for c, col in enumerate(cols):
            item = table.item(idx.row(), c)
            row_data[col] = item.text() if item else ''
        result.append(row_data)
    sys.stdout.write(json.dumps(result))

sys.exit(0)
'@

    try {
        Set-Content -Path $pyPath   -Value $pyScript -Encoding UTF8
        Set-Content -Path $dataPath -Value $json     -Encoding UTF8

        $output = & python3 $pyPath $dataPath 2>$null

        if ($LASTEXITCODE -eq 0 -and $output) {
            $selected = $output | ConvertFrom-Json
            if ($OutputMode -eq 'Single') {
                $selected | Select-Object -First 1
            } else {
                $selected
            }
        }
    }
    finally {
        Remove-Item $pyPath, $dataPath -Force -ErrorAction SilentlyContinue
    }
}}