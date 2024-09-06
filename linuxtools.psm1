# Define module/script scope variables here:
#

# Import functions within module
#write-host "Importing functions from LinuxTools module: $($PSScriptRoot)"
if (-not $IsLinux) {
	throw "This module is only supported on Linux"
}
('private','public') | Foreach-Object {
	Get-ChildItem -Path $(Join-Path -Path $PSScriptRoot -ChildPath $_) -Filter "*.ps1" | Foreach-Object { write-verbose $_.FullName; . $_.FullName }
}
