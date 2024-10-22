function Get-ProcessList {
	<#
	.SYNOPSIS
		Get-ProcessList retrieves a list of processes
	.DESCRIPTION
		Get-ProcessList retrieves a list of processes and sorts them by CPU usage in descending order
	.PARAMETER Top
		Top number of processes to display. Default is 10
	.EXAMPLE
		Get-ProcessList
		Get-ProcessList retrieves a list of processes and sorts them by CPU usage in descending order
	.EXAMPLE
		Get-ProcessList -Top 5
		Get-ProcessList retrieves a list of the top 5 processes sorted by CPU usage in descending order
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ProcessList.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][int]$Top = 10
	)
	Get-Process | Sort-Object CPU -Descending |
		Select-Object -First $Top -Property ID,Handles,WorkingSet,@{l='CPU';e={'{0:N}' -f $_.CPU}},ProcessName
}