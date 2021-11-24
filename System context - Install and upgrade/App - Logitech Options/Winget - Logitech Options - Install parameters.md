# Winget - Logitech Options - Install parameters
## About
* Winget id: Logitech.Options


## App information
### Name
#### Install
Logitech Options
#### Upgrade
Upgrade - Logitech Options

### Description
Logitech Options

### Publisher
Logitech

### App version
Latest from Winget


## Program
### Install command
#### Install
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && AppInstallerCLI.exe install --id Logitech.Options --silent --accept-package-agreements --accept-source-agreements"
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && AppInstallerCLI.exe upgrade --id Logitech.Options --silent --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "echo "Not added yet.""


## Requiresments
### All scenarios
* 64-bit
* >= Windows 10 2004 20H1

### Upgrade
#### Manually -> File
Path:  %ProgramW6432%\Logitech\LogiOptions
File:  LogiOptions.exe
Logic: Exists.


## Detection
### Install
#### Manually -> Files
Path:  %ProgramW6432%\Logitech\LogiOptions
File:  LogiOptions.exe
Logic: Exists.

### Upgrade
#### Script
Device_Detect-Upgrade_LogitechOptionsUpgradeAvailableUsingWinget.ps1


## Dependencies
None.


## Assignment
### Install
* Available

### Upgrade
* Required
