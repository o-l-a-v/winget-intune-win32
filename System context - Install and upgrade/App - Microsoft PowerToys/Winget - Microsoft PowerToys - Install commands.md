# Winget - Microsoft PowerToys - Install commands
## About
* Id in Microsoft Store: XP89DCGQ3K6VLD
  * Not using this because Microsoft Store is notorious for lagging behind on new versions because of the lengthy approval process.
* Id in Winget: Microsoft.PowerToys
* Winget might say update available when ```winget list --id Microsoft.PowerToys``` or ```winget upgrade```, but when ```winget upgrade --id Microsoft.PowerToys```, it says no update available.
  * Related issues:
    * https://github.com/microsoft/winget-cli/issues/752
    * https://github.com/microsoft/winget-pkgs/pull/36499#issuecomment-983378039
  * Workaround: Use ```winget install``` instead.


## App info
### Name
#### Install
Microsoft PowerToys
#### Upgrade
Upgrade - Microsoft PowerToys

### Description
Microsoft PowerToys

### Publisher
Microsoft

### App version
Latest from Winget


## Program
### Install command
#### Install
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && AppInstallerCLI.exe install --id Microsoft.PowerToys --silent --accept-package-agreements --accept-source-agreements"
#### Upgrade
##### Temp workaround
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && AppInstallerCLI.exe install --id Microsoft.PowerToys --silent --accept-package-agreements --accept-source-agreements"
##### When issues mentioned in About section is solved
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && AppInstallerCLI.exe upgrade --id Microsoft.PowerToys --silent --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "echo "Not added yet.""

### Behavior
System

### Exit codes
0 = Success


## Requirement
### Both
* 64 bit
* >= Windows 10 2004 20H1

### Upgrade
#### Manually -> File
Path:  %ProgramW6432%\PowerToys
File:  PowerToys.exe
Logic: Exists.


## Detection
### Install
#### Manually -> File
Path:  %ProgramW6432%\PowerToys
File:  PowerToys.exe
Logic: Exists.

### Upgrade
#### PowerShell
Device_Detect-Upgrade_MicrosoftPowerToysUpgradeAvailableUsingWinget.ps1
#### If CMD was an option
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && AppInstallerCLI.exe list Microsoft.PowerToys | find /i "available""


## Dependencies
### Install
Microsoft .NET Desktop Runtime v3.1.x x64

### Upgrade
None, was added when installed, and Windows Updates keeps .NET Desktop Runtime up to date.


## Assignment
### Install
* Available

### Upgrade
* Required