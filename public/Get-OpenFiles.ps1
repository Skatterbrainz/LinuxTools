function Get-OpenFiles {
	<##>
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