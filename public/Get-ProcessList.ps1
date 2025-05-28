function Get-ProcessList {
	<#
	.SYNOPSIS
		Get-ProcessList retrieves a list of processes
	.DESCRIPTION
		Get-ProcessList retrieves a list of processes and sorts them by CPU usage in descending order
	.PARAMETER Top
		Top number of processes to display. Default is 10
	.PARAMETER Detailed
		Retrieves detailed information about processes. If specified, you can also filter by ProcessName or PortNumber
	.PARAMETER ProcessName
		Name of the process to filter by when Detailed is specified
	.PARAMETER PortNumber
		Port number to filter processes by when Detailed is specified
	.EXAMPLE
		Get-ProcessList

		Get-ProcessList retrieves a list of processes and sorts them by CPU usage in descending order
	.EXAMPLE
		Get-ProcessList -Top 5

		Get-ProcessList retrieves a list of the top 5 processes sorted by CPU usage in descending order
	.EXAMPLE
		Get-ProcessList -Detailed

		Get-ProcessList retrieves detailed information about all processes
	.EXAMPLE
		Get-ProcessList -Detailed -ProcessName 'nginx'

		Get-ProcessList retrieves detailed information about the 'nginx' process
	.EXAMPLE
		Get-ProcessList -Detailed -PortNumber 443

		Get-ProcessList retrieves detailed information about processes using port 443
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-ProcessList.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][int]$Top = 10,
		[parameter(Mandatory=$False, ParameterSetName='Detailed')][switch]$Detailed,
		[parameter(Mandatory=$False, ParameterSetName='Detailed')][string]$ProcessName,
		[parameter(Mandatory=$False, ParameterSetName='Detailed')][int]$PortNumber
	)
	if ($Detailed.IsPresent) {
		if ($PortNumber -gt 0) {
			Invoke-Command -ScriptBlock { lsof -i :$PortNumber }
		} elseif (![string]::IsNullOrEmpty($ProcessName)) {
			Invoke-Command -ScriptBlock { lsof -c $ProcessName }
			Write-Host "Detailed process information for port $PortNumber"
		} else {
			Write-Host "Detailed process information for all processes"
			Invoke-Command -ScriptBlock { lsof }
		}
	} else {
		Get-Process | Sort-Object CPU -Descending |
			Select-Object -First $Top -Property ID,Handles,WorkingSet,@{l='CPU';e={'{0:N}' -f $_.CPU}},ProcessName
	}
}