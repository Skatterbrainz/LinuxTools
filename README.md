# LinuxTools

PowerShell Tools for Linux

![PowerShell](https://img.shields.io/badge/PowerShell-7.0%2B-blue)
![Platform](https://img.shields.io/badge/platform-Linux-orange)
![License](https://img.shields.io/badge/license-MIT-green)

A comprehensive collection of PowerShell cmdlets designed to make Linux system administration easier and more PowerShell-like. Just because I could, not that I should.

## 🎯 Overview

This module is currently focused on Debian/Ubuntu/LinuxMint with some KDE-compatible features. If there's more you want/need or anything you find lacking, annoying, aggravating, infuriating, discombobulating, or outright unsatisfying, drop a new [Issue](https://github.com/Skatterbrainz/LinuxTools/issues) here. Thank you!

## ✨ Features

- 🔍 **System Information** - Get detailed information about your Linux system, hardware, and configuration
- 📦 **Package Management** - Manage APT, DNF, Flatpak, and Snap packages with PowerShell cmdlets
- 👥 **User & Group Management** - Create, update, and manage local users and groups
- 🔐 **Security & Certificates** - View certificates, firewall status, and authentication logs
- 🌐 **Network Tools** - Query network configuration, IP settings, and connectivity
- 🖥️ **Desktop Environment** - Manage Cinnamon applets, extensions, themes, and more
- 📊 **System Monitoring** - Check memory, CPU, disk usage, and system health
- 🔧 **Process & Service Management** - Monitor processes, services, and system locks
- 📝 **Log Analysis** - Query and analyze system logs and journals
- 🎨 **Firefox Management** - Manage Firefox profiles and launch specific configurations

## Requirements

- PowerShell 7.0 or higher
- Linux operating system (Debian/Ubuntu/LinuxMint preferred)
- Appropriate system permissions for certain operations

## Installation

### From PowerShell Gallery (Recommended)

```powershell
Install-Module -Name LinuxTools -Scope CurrentUser
```

### From GitHub

1. **Clone the repository**
   ```bash
   git clone https://github.com/Skatterbrainz/LinuxTools.git
   cd LinuxTools
   ```

2. **Import the module**
   ```powershell
   Import-Module ./linuxtools.psd1
   ```

## Usage

Import the module and explore available cmdlets:

```powershell
# Import the module
Import-Module LinuxTools

# Get all available cmdlets
Get-Command -Module LinuxTools

# Get help for a specific cmdlet
Get-Help Get-SystemInfo -Full

# Example: Get system information
Get-SystemInfo

# Example: Update all packages
Update-LinuxPackages

# Example: Check for pending package updates
Get-PackageUpdates -Summary

# Example: Get local users
Get-LocalUser
```

## 📖 Documentation

Full documentation for each cmdlet is available in the [docs](./docs) directory:

- [Get-SystemInfo](./docs/Get-SystemInfo.md) - Get comprehensive system information
- [Get-LinuxPackages](./docs/Get-LinuxPackages.md) - List installed packages
- [Get-PackageUpdates](./docs/Get-PackageUpdates.md) - List pending package updates
- [Get-DefaultApplication](./docs/Get-DefaultApplication.md) - Query MIME default applications
- [Get-DesktopEntries](./docs/Get-DesktopEntries.md) - Query desktop entry files across user, system, and autostart locations
- [Get-NetworkConnections](./docs/Get-NetworkConnections.md) - Inspect listening and active sockets
- [Get-SwapInfo](./docs/Get-SwapInfo.md) - Get swap usage and swappiness
- [Get-AptSources](./docs/Get-AptSources.md) - List active apt repository entries
- [Get-GPUInfo](./docs/Get-GPUInfo.md) - Get GPU adapter and driver details
- [Get-SystemErrors](./docs/Get-SystemErrors.md) - Aggregate errors from journal and common Linux log files
- [Get-NotificationDaemon](./docs/Get-NotificationDaemon.md) - Detect active desktop notification daemon processes
- [Get-LibraryVersions](./docs/Get-LibraryVersions.md) - List installed versions of common runtime libraries
- [Test-SystemHealth](./docs/Test-SystemHealth.md) - Run a consolidated health check across key system signals
- [Update-LinuxPackages](./docs/Update-LinuxPackages.md) - Update packages across available package managers
- [Get-LocalUser](./docs/Get-LocalUser.md) - Get local user accounts
- [Get-ProcessList](./docs/Get-ProcessList.md) - Get running processes
- And [many more](./docs)...

## Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features or cmdlets
- Add support for more Linux distributions
- Improve documentation
- Submit pull requests

Please open an [issue](https://github.com/Skatterbrainz/LinuxTools/issues) or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Skatterbrainz**
- GitHub: [@Skatterbrainz](https://github.com/Skatterbrainz)

## Acknowledgments

- Built for PowerShell 7+ on Linux
- Inspired by the need to bring PowerShell-style management to Linux systems
- Thanks to all contributors and users who have provided feedback and suggestions

---

## 📋 Version History

Revision history has been moved to [ChangeLog.md](./ChangeLog.md).
