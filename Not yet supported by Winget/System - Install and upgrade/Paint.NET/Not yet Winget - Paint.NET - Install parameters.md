# Not yet Winget - Paint.NET - Install parameters
## About
### Why custom
* Not supported by winget yet because it's a MSI inside a ZIP.
* Not easy or scalable to buy Microsoft Store apps for enterprise yet.

### Resources
* [Paint.NET Home](https://www.getpaint.net/)
* [Paint.NET Forum](https://forums.getpaint.net/)
* [Paint.NET GitHub repo for releases](https://github.com/paintdotnet/release)
* [Paint.NET install parameters](https://www.getpaint.net/doc/latest/UnattendedInstallation.html)
* [Paint.NET on Microsoft Store](https://www.microsoft.com/en-us/store/apps/9nbhcs1lx4r0)


## App information
### Name
#### Install
Paint.NET
#### Upgrade
Upgrade - Paint.NET

### Description
Paint.NET

### Publisher
Rick Brewster

### Version
Latest from GitHub

### Project
https://github.com/paintdotnet/release


## Program
### Install command
"%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy "Bypass" -NoLogo -NonInteractive -NoProfile -WindowStyle "Hidden" -Command "& '.\Device_Install-Paint.NET_LatestVersion.ps1'; exit $LASTEXITCODE"

### Uninstall command
"%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy "Bypass" -NoLogo -NonInteractive -NoProfile -WindowStyle "Hidden" -Command "& '.\Device_Uninstall-Paint.NET_AnyVersion'; exit $LASTEXITCODE"

### Behavior
System


## Requiresments
### Any scenario
* >= Windows 10 2004 20H1
* 64 bit

### Upgrade
#### Manually -> File
Path:  %ProgramW6432%\paint.net
File:  paintdotnet.exe
Logic: Exists
#### Script
Device_Require-Paint.NET_DoesNotRun.ps1


## Detection
### Install
#### Manually -> File
Path:  %ProgramW6432%\paint.net
File:  paintdotnet.exe
Logic: Exists
### Upgrade
#### Script
Device_Detect-Paint.NET_IsLatestVersion.ps1


## Dependencies
None


## Assignment
### Install
* Available

### Upgrade
* Required