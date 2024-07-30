# Define module/script scope variables here:
#

# Import functions within module
write-host "Importing functions from LinuxTools module: $($PSScriptRoot)"
('private','public') | Foreach-Object {
	Get-ChildItem -Path $(Join-Path -Path $PSScriptRoot -ChildPath $_) -Filter "*.ps1" | Foreach-Object { . $_.FullName }
}
