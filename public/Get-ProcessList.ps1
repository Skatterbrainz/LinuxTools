function Get-ProcessList {
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][int]$Top = 10
	)
	Get-Process | Sort-Object CPU -Descending |
		Select-Object -First $Top -Property ID,Handles,WorkingSet,@{l='CPU';e={'{0:N}' -f $_.CPU}},ProcessName
}