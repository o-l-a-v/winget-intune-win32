# Winget - 7-Zip - Install parameters
## About
* Winget id: 7zip.7zip


## App info
### Name
#### Available, Required
7-Zip
#### Update
Upgrade - 7-Zip

### Description
7-Zip

### Publisher
Igor Pavlov

### App version
Latest from Winget


## Program
### Install command
#### Install
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id 7zip.7zip --silent --source winget --accept-package-agreements --accept-source-agreements"
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id 7zip.7zip --silent --source winget --accept-package-agreements --accept-source-agreements"

### Uninstall command
#### Winget
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id 7zip.7zip --silent --source winget --accept-source-agreements"
#### Native
"%ProgramW6432%\7-Zip\Uninstall.exe" /S

### Behavior
System

### Exit codes
0 = Success


## Requirements
### All scenarios
* 64 bit
* >= Windows 10 2004 20H1

### Upgrade
#### Manually -> File
Path:  %ProgramW6432%\7-Zip
File:  7z.exe
Logic: Exists.
#### Script
Script: Device_Require-7ZipDoesNotRun.ps1
Type:   Boolean
Logic:  $true means not running, which is what we want.


## Detection
### Install
#### Manually -> File
Path:  %ProgramW6432%\7-Zip
File:  7z.exe
Logic: Exists.

### Upgrade
#### Script
Device_Detect-Upgrade_7ZipUpgradeAvailableUsingWinget.ps1


## Dependencies
Dependency - Microsoft Visual C++ 2015-2022


## Assignment
### Install
* Available

### Upgrade
* Required
