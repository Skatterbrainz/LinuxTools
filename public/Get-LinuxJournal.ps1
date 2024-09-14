function Get-LinuxJournal {
	<#
	.SYNOPSIS
		Invoke the journalctl command with various options.
	.DESCRIPTION
		Invoke the journalctl command with various options.
	.PARAMETER omg
		I'm not going to spend an evening documenting all the parameters. If you're using this function
		you probably know about the journalctl command, and hopefully, you used the 'man' command on it
		to read the options it provides. I'm too lazy.

	.EXAMPLE
		Get-LinuxJournal -Lines 10 -Follow
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-LinuxJournal.md
	#>

	param (
		[switch]$Boot,
		[string]$Identifier,
		[string]$UnitName,
		[string]$UserUnit,
		[string]$User,
		[string]$SystemdUnit,
		[string]$ID,
		[string]$GrepPattern,
		[string]$CaseSensitive,
		[switch]$Reverse,
		[int]$Lines,
		[string]$Since,
		[string]$Until,
		[string]$Cursor,
		[string]$After,
		[string]$Follow,
		[switch]$Merge,
		[switch]$ThisBoot,
		[switch]$OutputFields,
		[switch]$OutputVerbose,
		[switch]$OutputCatalog,
		[switch]$UTC,
		[switch]$NoHostname,
		[switch]$NoFullyQualifiedDomainName,
		[switch]$NoPageSize,
		[switch]$NoTail,
		[switch]$Quiet
	)

	$command = "journalctl"

	if ($Boot) { $command += " --boot" }
	if ($Identifier) { $command += " --identifier=$Identifier" }
	if ($UnitName) { $command += " --unit=$UnitName" }
	if ($UserUnit) { $command += " --user-unit=$UserUnit" }
	if ($User) { $command += " --user=$User" }
	if ($SystemdUnit) { $command += " --system=$SystemdUnit" }
	if ($ID) { $command += " _PID=$ID" }
	if ($GrepPattern) { $command += " | grep $GrepPattern" }
	if ($CaseSensitive) { $command += " --case-sensitive=$CaseSensitive" }
	if ($Reverse) { $command += " --reverse" }
	if ($Lines) { $command += " --lines=$Lines" }
	if ($Since) { $command += " --since='$Since'" }
	if ($Until) { $command += " --until='$Until'" }
	if ($Cursor) { $command += " --cursor='$Cursor'" }
	if ($After) { $command += " --after='$After'" }
	if ($Follow) { $command += " --follow=$Follow" }
	if ($Merge) { $command += " --merge" }
	if ($ThisBoot) { $command += " --this-boot" }
	if ($OutputFields) { $command += " --output-fields" }
	if ($OutputVerbose) { $command += " --output-verbose" }
	if ($OutputCatalog) { $command += " --output-catalog" }
	if ($UTC) { $command += " --utc" }
	if ($NoHostname) { $command += " --no-hostname" }
	if ($NoFullyQualifiedDomainName) { $command += " --no-full" }
	if ($NoPageSize) { $command += " --no-pager" }
	if ($NoTail) { $command += " --no-tail" }
	if ($Quiet) { $command += " --quiet" }

	Write-Host "Executing command: $command"
	Invoke-Expression -Command "$command"
}