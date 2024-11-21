function New-ToastNotification {
	<#
	.SYNOPSIS
		Displays a desktop notification message using notify-send
	.DESCRIPTION
		Displays a desktop notification message using notify-send with optional parameters
	.PARAMETER Message
		The message to display in the notification. This can include the following HTML tags for formatting:
		<b></b> - bold
		<i></i> - italic
		<u></u> - underline
		<a href="..."></a>  - hyperlink
		<img src="..." alt="..."/> - image
	.PARAMETER Title
		The title of the notification. Default is "Notification"
	.PARAMETER Urgency
		The urgency level of the notification (low, normal, critical). Default is normal
	.PARAMETER IconName
		The icon to display in the notification. Default is dialog-information.png
		Filenames are found in /usr/share/icons/gnome/48x48/status/
		if the specified icon is not found, no icon will be displayed
	.PARAMETER Wait
		Wait for the notification to be closed before continuing. Default is notification closes after a brief delay
	.EXAMPLE
		New-ToastNotification -Message "Hello World!"
		Displays a notification with the message "Hello World!"
	.EXAMPLE
		New-ToastNotification -Message "Hello World!" -Title "Greetings"
		Displays a notification with the message "Hello World!" and the title "Greetings"
	.EXAMPLE
		New-ToastNotification -Message "Hello World!" -Urgency critical
		Displays a critical notification with the message "Hello World!"
	.EXAMPLE
		New-ToastNotification -Message "Hello World!" -Icon dialog-warning.png
		Displays a notification with the message "Hello World!" and the icon dialog-warning.png
	.NOTES
		#notify-send "<b>Hello World!</b>This is a message from PowerShell" -u critical -i /usr/share/icons/gnome/48x48/status/dialog-warning.png
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true)][string]$Message,
		[parameter()][alias('Summary')][string]$Title = "Notification",
		[parameter()][alias('Category')][string][ValidateSet('low','normal','critical')]$Urgency = 'normal',
		[parameter()][alias('Icon')][string]$IconName = 'dialog-information.png',
		[parameter()][switch]$Wait
	)
	try {
		$iconPath = '/usr/share/icons/gnome/48x48/status/'
		$iconFile = Join-Path $iconPath $IconName
		if (!(Test-Path -Path $Icon)) {
			Write-Warning "Iconfile not found: $Icon"
			$block = "notify-send -u $Urgency"
		} else {
			$block = "notify-send -u $Urgency -i $iconfile"
		}
		if ($Wait.IsPresent) {
			$block += " -w"
		}
		Invoke-Expression "$block '$Title' '$Message'"
	} catch {
		Write-Error $_.Exception.Message
	}
}