function Start-FileSync {
	<#
	.SYNOPSIS
		Synchronizes files from a source directory to a destination directory.
	.DESCRIPTION
		This function uses rsync to synchronize files from a source directory to a destination directory, with options for pruning and forced copying.
	.PARAMETER SourcePath
		The path to the source directory containing files to synchronize.
	.PARAMETER DestinationPath
		The path to the destination directory where files will be synchronized.
	.PARAMETER Prune
		Whether to prune files in the destination that are not present in the source directory.
	.PARAMETER ForceCopy
		Whether to force the creation of the destination directory if it does not exist.
	.EXAMPLE
		Start-FileSync -SourcePath "/var/www/html" -DestinationPath "/backup/html"
		This example synchronizes files from the source directory to the destination directory without pruning.
	.EXAMPLE
		Start-FileSync -SourcePath "/var/www/html" -DestinationPath "/backup/html" -Prune
		This example synchronizes files and prunes the destination directory, removing files that are not present in the source directory.
	.EXAMPLE
		Start-FileSync -SourcePath "/var/www/html" -DestinationPath "/backup/html" -ForceCopy
		This example synchronizes files and forces the creation of the destination directory if it does not exist.
	.LINK
		https://example.com/Start-FileSynchttps://github.com/Skatterbrainz/linuxtools/blob/master/docs/Start-FileSync.md
	#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)]
		[string]$SourcePath,

		[Parameter(Mandatory=$true)]
		[string]$DestinationPath,

		[Parameter(Mandatory=$false)]
		[switch]$Prune,

		[Parameter(Mandatory=$false)]
		[switch]$ForceCopy
	)

	# Start the file synchronization processing
	try {
		if (-Not (Get-Command rsync -ErrorAction SilentlyContinue)) {
			throw "rsync command not found. Please install rsync to use this function."
		}
		if (-Not (Test-Path -Path $SourcePath)) {
			throw "Source path '$SourcePath' does not exist."
		}
		if (-Not (Test-Path -Path $DestinationPath)) {
			if ($ForceCopy.IsPresent) {
				New-Item -Path $DestinationPath -ItemType Directory | Out-Null
			} else {
				throw "Destination path '$DestinationPath' does not exist. Use -ForceCopy to create it."
			}
		}
		if ($Prune.IsPresent) {
			# If pruning is enabled, use the --delete option to remove files not present in source
			$commandstring = "rsync -av --progress --delete '$SourcePath/' '$DestinationPath/'"
		} else {
			# Regular sync without pruning
			$commandstring = "rsync -av --progress '$SourcePath/' '$DestinationPath/'"
		}
		Write-Verbose "Executing command: $commandstring"
		Invoke-Expression $commandstring
	} catch {
		Write-Error $_
	}
}