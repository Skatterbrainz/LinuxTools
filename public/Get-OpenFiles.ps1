function Get-OpenFiles {
	<#
	.SYNOPSIS
		Get open files on a Linux system.
	.DESCRIPTION
		Get open files on a Linux system. This cmdlet uses the lsof command to list open files on a Linux system.
	.PARAMETER Path
		Filter by path.
	.PARAMETER UserName
		Filter by user name.
	.PARAMETER ProcessId
		Filter by process ID.
	.PARAMETER IPv4
		Filter by IPv4.
	.PARAMETER IPv6
		Filter by IPv6.
	.EXAMPLE
		Get-OpenFiles -Path /tmp
		Get open files in the /tmp directory.
	.EXAMPLE
		Get-OpenFiles -UserName root
		Get open files owned by the root user.
	.EXAMPLE
		Get-OpenFiles -ProcessId 1234
		Get open files for process ID 1234.
	.EXAMPLE
		Get-OpenFiles -IPv4
		Get open files using IPv4.
	.EXAMPLE
		Get-OpenFiles -Path /home/user123 -UserName user123
		Get open files in the /home/user123 directory owned by the user123 user.
	.LINK
	#>
	[CmdletBinding()]
	param(
		[parameter()][string]$Path,
		[parameter()][string[]]$UserName,
		[parameter()][int[]]$ProcessId,
		[parameter()][switch]$IPv4,
		[parameter()][switch]$IPv6
	)
	try {
		$basecmd = "sudo lsof -w"
		if (![string]::IsNullOrEmpty($ProcessId)) {
			$pids = $ProcessId -join ","
			$basecmd += " -p $pids"
		}
		if (![string]::IsNullOrEmpty($UserName)) {
			$unames = $UserName -join ","
			$basecmd += " -u $unames"
		} 
		if (![string]::IsNullOrEmpty($Path)) {
			$basecmd += " $Path"
		}
		if ($IPv4) {
			$basecmd += " -i 4"
		}
		if ($IPv6) {
			$basecmd += " -i 6"
		}
		Write-Verbose $basecmd
		Invoke-Expression $basecmd
	} catch {
		Write-Error $_.Exception.Message
	}
}