function ConvertTo-Flac {
	<#
	.SYNOPSIS
		Converts audio files to FLAC format using ffmpeg.
	.DESCRIPTION
		This function takes a source directory containing audio files and converts them to FLAC format, saving them in the specified destination directory.
	.PARAMETER SourcePath
		The path to the source directory containing audio files to be converted.
	.PARAMETER DestinationPath
		The path to the destination directory where converted FLAC files will be saved.
	.PARAMETER fileTypes
		A comma-separated list of audio file extensions to convert (default: "mp3,wav,aac,ogg,m4a").
	.PARAMETER Overwrite
		Switch to overwrite existing FLAC files in the destination directory.
	.EXAMPLE
		ConvertTo-Flac -SourcePath "C:\Music\ToConvert" -DestinationPath "C:\Music\FLAC" -fileTypes "mp3,wav" -Overwrite
		Converts all mp3 and wav files in "C:\Music\ToConvert" to FLAC format and saves them in "C:\Music\FLAC", overwriting any existing FLAC files.
	.NOTES
		Requires ffmpeg to be installed and accessible in the system PATH.
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory = $true)][string]$SourcePath,
		[parameter(Mandatory = $true)][string]$DestinationPath,
		[parameter(Mandatory = $false)][string]$fileTypes = "mp3,wav,aac,ogg,m4a",  # Comma-separated list of file extensions
		[parameter(Mandatory = $false)][switch]$Overwrite
	)

	if (!(Test-Path -Path $SourcePath)) {
		throw "Source file not found: $SourcePath"
	}
	if (!(Test-Path -Path $DestinationPath)) {
		throw "Destination folder not found: $DestinationPath"
	}
	if (!(Get-Command -Name "ffmpeg" -ErrorAction SilentlyContinue)) {
		throw "ffmpeg is not installed or not available in the system PATH."
	}
	$ffmpegPath = "ffmpeg"  # Assuming ffmpeg is in the system PATH
	$typesList = $fileTypes.Split(',') | ForEach-Object { "*.$($_)" }

	$sourceFiles = Get-ChildItem -Path (Join-Path (Resolve-Path -Path $SourcePath) -ChildPath "*") -Filter -Include $typesList -File
	Write-Host "$($sourceFiles.Count) files found for conversion."

	foreach ($file in $sourceFiles) {
		$destinationFile = Join-Path -Path $DestinationPath -ChildPath ($file.BaseName + ".flac")
		if (Test-Path -Path $DestinationFile) {
			if ($Overwrite) {
				Write-Warning "Overwriting existing file: $destinationFile"
			} else {
				Write-Warning "Skipping conversion for $($file.Name) as $destinationFile already exists."
				continue
			}
		}
		$ffmpegArgs = @("-i", "`"$($file.FullName)`"", "-c:a", "flac", "`"$destinationFile`"")
		try {
			Write-Host "Converting $($file.Name) to FLAC format..."
			$process = Start-Process -FilePath $ffmpegPath -ArgumentList $ffmpegArgs -NoNewWindow -Wait -PassThru
			if ($process.ExitCode -eq 0) {
				Write-Host "Successfully converted to $destinationFile"
			} else {
				Write-Warning "Failed to convert $($file.Name). ffmpeg exited with code $($process.ExitCode)"
			}
		} catch {
			$msg = $_.Exception.Message
			Write-Error "Error during conversion of $($file.Name): $msg"
		}
	}
}
