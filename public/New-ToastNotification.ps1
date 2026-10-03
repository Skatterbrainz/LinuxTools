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
		The urgency level of the notification (Low, Normal, Critical). Default is Normal
	.PARAMETER IconName
		The icon to display in the notification. Cinnamon requires the full path to the icon file.
		Default is no icon.
	.PARAMETER Timeout
		The time in milliseconds before the notification closes automatically. Default is the notification closes after a brief delay.
		Note that if Urgency is Critical, the notification may not respect the Timeout setting.
	.PARAMETER Wait
		Wait for the notification to be closed before continuing. Default is notification closes after a brief delay
	.PARAMETER ActionName
		The name of the action button to display in the notification. If provided, implies -Wait
		If not specified, no action button will be displayed.
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
	.EXAMPLE
		New-ToastNotification -Message "Hello World!" -ActionName "OK"
		Displays a notification with the message "Hello World!" and an action button labeled "OK",
		if clicked, will return 0 (zero) as the response.
	.NOTES
		#notify-send "<b>Hello World!</b>This is a message from PowerShell" -u critical -i /usr/share/icons/gnome/48x48/status/dialog-warning.png
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/New-ToastNotification.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true)][string]$Message,
		[parameter(Mandatory=$false)][alias('Summary')][string]$Title = "LinuxTools Message",
		[parameter(Mandatory=$false)][alias('Category')][string][ValidateSet('Low','Normal','Critical')]$Urgency = 'Normal',
		[parameter(Mandatory=$false)][alias('Icon')][string]$IconName,
		[parameter(Mandatory=$false)][int]$Timeout,
		[parameter(Mandatory=$false)][switch]$Wait,
		[parameter(Mandatory=$false)][string]$ActionName
	)
	try {
		$notifyParamsBlock = "notify-send --urgency $Urgency"
		if ($Wait.IsPresent) {
			$notifyParamsBlock += " --wait"
		}
		if ($Timeout) {
			$notifyParamsBlock += " --expire-time $Timeout"
		}

		if (![string]::IsNullOrEmpty($IconName)) {
			$notifyParamsBlock += " --icon $IconName"
		}
		if (![string]::IsNullOrEmpty($ActionName)) {
			$notifyParamsBlock += " --action `"$ActionName`""
		}
		Write-Verbose "command: $notifyParamsBlock '$Title' '$Message'"
		Invoke-Expression "$notifyParamsBlock '$Title' '$Message'"
	} catch {
		Write-Error $_.Exception.Message
	}
}