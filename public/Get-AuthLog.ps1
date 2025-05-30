function Get-AuthLog {
	<#
	.SYNOPSIS
		Parses the authentication log file and returns structured data.
	.DESCRIPTION
		Parses the authentication log file located at /var/log/auth.log (or a specified path) and returns structured data.
		You can filter the log entries by providing a filter string.
	.PARAMETER Path
		The path to the authentication log file. Default is "/var/log/auth.log".
	.PARAMETER Filter
		A filter string to match against the log entries. Only entries that match this filter will be returned.
	.EXAMPLE
		Get-AuthLog -Path "/var/log/auth.log" -Filter "pam_unix"
		This example retrieves all log entries from the authentication log that contain the string "pam_unix".
	.EXAMPLE
		Get-AuthLog
		This example retrieves all log entries from the default authentication log file "/var/log/auth.log".
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-AuthLog.md
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory = $false)][string]$Path = "/var/log/auth.log",
		[parameter(Mandatory = $false)][string]$Filter
	)
	$lines = Get-Content -Path $Path
	if (![string]::IsNullOrWhiteSpace($Filter)) {
		$lines = $lines | Where-Object { $_ -match $Filter }
	}
	foreach ($line in $lines) {
		# example: 2025-05-25T00:17:01.905151-04:00 p50 CRON[51107]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
		$date = (Get-Date $line.substring(0,19))
		# machine hostname is "p50"
		$hostname = $line.split(" ")[1]
		# process name is "CRON"
		$process = $line.split(" ")[2] -replace(":", "")
		# process ID is "51107" which is inside the square brackets
		if ($line -match "\[(\d+)\]") {
			# extract the process ID from the square brackets
			# e.g., CRON[51107]
			# split the line by the square brackets and take the second part
			# then split by "]" to get the process ID
			# e.g., CRON[51107]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
			$procid = $line.split("[")[1].split("]")[0]
		}
		# message is the rest of the line
		$message = $line.split(":")[3..$line.Length].Trim()
		# create a custom object to hold the parsed data
		[PSCustomObject]@{
			Date     = $date
			Hostname = $hostname
			Process  = $process
			ProcID   = $procid
			Message  = $message
		}
	}
}