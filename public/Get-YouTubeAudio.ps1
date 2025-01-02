function Get-YouTubeAudio {
    <#
    .SYNOPSIS
        Downloads audio from a YouTube video using yt-dlp.
    .DESCRIPTION
        Downloads audio from a YouTube video using yt-dlp. The audio is saved as an MP3 file in the specified output path.
    .PARAMETER URL
        The URL of the YouTube video.
    .PARAMETER OutputPath
        The path where the audio file will be saved. The default value is ~/Downloads.
    .PARAMETER NewName
        The new name of the audio file. The default value is the original name of the audio file.
    .PARAMETER ytdlpPath
        The path to the yt-dlp executable. The default value is /usr/bin/yt-dlp.
    .PARAMETER ytdlpOptions
        The options to pass to yt-dlp. The default value is "-f bestaudio --extract-audio --audio-format m4a".
    .EXAMPLE
        Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id"
        Downloads the audio from the YouTube video with the specified video ID.
    .EXAMPLE
        Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id" -OutputPath "~/Music"
        Exported list of pending updates for non-AVD machines. Only two items appear this week. Both are related to ASP.NET core, or .NET framework, and both are on machine WVMAFSQ01. 
    .EXAMPLE
        Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id" -OutputPath "~/Music" -NewName "my_audio"
        Downloads the audio from the YouTube video with the specified video ID and saves it as "my_audio.m4a" in the specified output path.
    .EXAMPLE
        Get-YouTubeAudio -URL "https://www.youtube.com/watch?v=video_id" -OutputPath "~/Music" -ytdlpOptions "-f 139"
        Downloads the audio from the YouTube video with the specified video ID using the specified yt-dlp options.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string][ValidateNotNullOrEmpty()]$URL,
        [Parameter(Mandatory=$false)][string]$OutputPath = "~/Downloads",
        [Parameter(Mandatory=$false)][string]$NewName,
        [Parameter(Mandatory=$false)][string]$ytdlpPath = "/usr/bin/yt-dlp",
        [Parameter(Mandatory=$false)][string]$ytdlpOptions = "-f bestaudio --extract-audio --audio-format m4a"
    )
    try {
        if (-not (Test-Path $OutputPath)) {
            New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
        }
        if (-not (Test-Path '/usr/bin/yt-dlp')) {
            Write-Warning "yt-dlp is not installed. Please install it first (e.g. sudo apt install yt-dlp)"
            return
        }
        $cmd = Invoke-Command -ScriptBlock {
            write-host "options: $ytdlpOptions"
            Invoke-Expression "/usr/bin/yt-dlp $ytdlpOptions $URL"
        } -WarningAction SilentlyContinue
        #yt-dlp -F $url
        #/usr/bin/yt-dlp -f 139 $URL
        $files = Get-ChildItem -Path ./* -Include ("*m4a","*mp3") -File
        foreach ($file in $files) {
            if ($NewName) {
                $newfile = Rename-Item -Path $file.FullName -NewName "$NewName.m4a" -PassThru
                Write-Host "Moving $($newfile.Name) to $OutputPath" -ForegroundColor Cyan
                $newfile | Move-Item -Destination $OutputPath
            } else {
                Write-Host "Moving $($file.Name) to $OutputPath" -ForegroundColor Cyan
                $file | Move-Item -Destination $OutputPath
            }
        }
    } catch {
        Write-Error $_.Exception.Message
        return
    }
}