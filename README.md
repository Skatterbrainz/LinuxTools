# LinuxTools

PowerShell Tools for Linux

Just because I could, not that I should. This is currently somewhat Debian/Ubuntu/LinuxMint focused with a tiny bit of KDE-compatible chunks stirred into the pot. If there's more you want/need or anything you find lacking, annoying, aggravating, infuriating, discombobulating, or outright unsatisfying, drop a new [Issue](https://github.com/Skatterbrainz/LinuxTools/issues) here.  Thank you!

- 1.1.5 - 09/27/2025
  - Updated: Get-FirewallStatus

- 1.1.4 - 09/27/2025
  - Added: Start-FlatpakApplication

- 1.1.3 - 08/02/2025
  - Added: Get-RootCertificates
  - Added: Get-Certificates
  - Added: Start-FileSync

- 1.1.2 - 06/13/2025
  - Fixed: PSD1 didn't load Out-GridForm (not enough coffee that day)

- 1.1.1 - 05/29/2025
  - Updated: Get-ProcessList
  - Added: Get-TimeZone.md
  - Added: Get-AuthLog
  - Added: Out-GridForm
  - Updated: New-LocalGroup
  - Updated: New-LocalUser
  - Updated: Remove-LocalGroup
  - Updated: Remove-LocalGroupmember
  - Updated: Remove-LocalUser
  - Updated: Update-DnfPackage
  - Updated: Invoke-LogAssessment

- 1.1.0 - 05/01/2025
  - Added: Get-IPC
  - Added: Get-IPConfig
  - Added: Get-IRQ
  - Added: Get-DnfPackages
  - Added: Get-SystemLocks
  - Added: Get-SerialNumber
  - Added: Update-DnfPackages
  - Updated: Update-AptPackages to support nala
  - Updated: Get-DeviceHardware
  - Updated: Get-LinuxPackages
  - Renamed: Get-AptPackageInventory to Get-AptPackages
  - Renamed: Get-AptPkgUpgradeable to Get-AptPackageUpgradeable
  - OmG! Are you NOT entertained? Why am I doing this? I keep asking myself that too.

- 1.0.18 - 03/10/2025
  - Added: [Get-AutoStartApps](./docs/Get-AutoStartApps.md)
  - Fixed: bug in Get-CinnamonVersion
  - Fixed: bug in Get-Environment
  - Fixed: Get-AptPkgUpgradeable
  - Moved: Apt, Flatpak and Snap functions to public files

- 1.0.17 - 01/16/2025
  - Added [Get-OpenFiles](./docs/Get-OpenFiles.md)
  - Added [Update-AllModules](./docs/Update-AllModules.md)
  - Fixed: missing LINK properties on multiple function comments

- 1.0.16 - 01/08/2025
  - Updated [New-LocalUser](./docs/New-LocalUser.md) with steroids and a testosterone vape. Also -Password requires a SecureString
  - Updated [Update-LocalUser](./docs/Update-LocalUser.md) with even more steroids, caffeine and some sort of white powder substance. -NewPassword requires a SecureString.
  - Updated [New-LocalGroup](./docs/New-LocalGroup.md) but only with cold coffee
  - Added [Update-LocalGroup](./docs/Update-LocalGroup.md)
  - Added [Remove-LocalGroup](./docs/Remove-LocalGroup.md)
  - Added [Get-DeviceHardware](./docs/Get-DeviceHardware.md)
  - Added [Get-UsbDevices](./docs/Get-UsbDevices.md)

- 1.0.15 - 01/05/2025
  - Added [Get-XsessionErrors](./docs/Get-XsessionErrors.md)
  - Added [Invoke-LogAssessment](./docs/Invoke-LogAssessment.md) (requires module: PSAI)

- 1.0.14 - 01/02/2025
  - Added [Get-YouTubeAudio](./docs/Get-YouTubeAudio.md)

- 1.0.13 - 11/11/2024
  - Added [New-ToastNotification](./docs/New-ToastNotification.md)

- 1.0.12 - 11/2/2024
  - Cleaned up Repository content

- 1.0.11 - 10/24/2024
  - Added [Get-CinnamonVersion](./docs/Get-CinnamonVersion.md)
  - Added $IsCinnamon global variable
  - Added [Get-UbuntuAdjustments](./docs/Get-UbuntuAdjustments.md)
  - Added [Get-DiskInfo](./docs/Get-DiskInfo.md)
  - Updated [Get-DesktopEnvironment](./docs/Get-DesktopEnvironment.md)

- 1.0.10 - 10/22/2024
  - Added [Get-CinnamonApplets](./docs/Get-CinnamonApplets.md)
  - Added [Get-CinnamonExtension](./docs/Get-CinnamonExtensions.md)
  - Added [Get-CinnamonSpices](./docs/Get-CinnamonSpices.md)
  - Added [Get-DegradedSystemInfo](./docs/Get-DegradedSystemInfo.md)
  - Added [Get-DesktopThemes](./docs/Get-DesktopThemes.md)
  - Added [Get-ShutDownTimeOut](./docs/Get-ShutDownTimeOut.md)
  - Added [Get-SystemCtl](./docs/Get-SystemCtl.md)
  - Updated [Get-ProcessList](./docs/Get-ProcessList.md)

- 1.0.9 - 10/15/2024 "almost to 10!!"
  - Added [Get-MemoryConfiguration](./docs/Get-MemoryConfiguration.md)

- 1.0.8 - 10/1/2024
  - Added [Get-AppLaunchers](./docs/Get-AppLaunchers.md)
  - Added [Test-ServiceRebootPending](./docs/Test-ServiceRebootPending.md)
  - Added [Get-FirewallStatus](./docs/Get-FirewallStatus.md)

- 1.0.7 - 9/19/2024
  - Added [Get-DesktopEnvironment](./docs/Get-DesktopEnvironment.md)
  - Added [Get-FireFoxProfiles](./docs/Get-FireFoxProfiles.md)
  - Added [Start-FireFoxProfile](./docs/Start-FireFoxProfile.md)
  - Fixed missing LINK ref for [Get-ComputerInventory](./docs/Get-ComputerInventory.md)

- 1.0.6 - 9/15/2024
  - Added [Get-SysCtl](./docs/Get-SysCtl.md)
  - Added [Get-MemoryInfo](./docs/Get-MemoryInfo.md)
  - Added [Get-MemoryPressure](./docs/Get-MemoryPressure.md)

- 1.0.5 - 9/6/2024
  - Added Add-LocalGroupMember
  - Added Get-LocalGroupMember
  - Added New-LocalGroup
  - Added Remove-LocalGroupMember
  - Updated Get-LocalGroup to change -Identity to -Name for consistency

- 1.0.4 - 9/6/2024
  - Added Get-ComputerInventory
  - Added Get-CronTabs
  - Added Get-DefaultAudioPlayer
  - Added Get-DefaultBrowser
  - Added Get-LinuxDistro
  - Added Unlock-LocalUser
  - Added Update-LocalUser
  - Updated Get-LocalUser
  - Updated New-LocalUser
  - Updated Remove-LocalUser

- 1.0.3 - 9/4/2024
  - Added Get-LenovoDevice
  - Updated Get-ComputerInfo to include serial number

- 1.0.2 - 9/1/2024
  - Bug fixes in Get-AptPkgInventory, Get-ComputerInventory
  - Bug fixes in Get-Environment
  - Added Get-MountedItems

- 1.0.1 - 8/6/2024
  - I can't remember what I did, and the repo history is being mean to me

- 1.0.0 - 8/2/2024
  - Congratulations! It's a healthy baby, ughhhh... something.