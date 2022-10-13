# Winget - OBS Studio - Install parameters
## About
* Winget id: ```OBSProject.OBSStudio```.
* Creates a desktop shortcut by default.


## App information
### Name
#### Install
OBS Studio
#### Upgrade
Upgrade - OBS Studio

### Description
OBS Studio

### Publisher
OBS Project

### App version
Latest from Winget


## Program
### Install command
#### Install
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id OBSProject.OBSStudio --silent --source winget --accept-package-agreements --accept-source-agreements && del "%PUBLIC%\Desktop\OBS Studio.lnk""
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id OBSProject.OBSStudio --silent --source winget --accept-package-agreements --accept-source-agreements && del "%PUBLIC%\Desktop\OBS Studio.lnk""

### Uninstall command
#### Winget
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id OBSProject.OBSStudio --silent --source winget --accept-source-agreements"
#### Native
cmd /c ""%ProgramW6432%\obs-studio\uninstall.exe" /S"

### Behavior
System


## Requirements
### Both
#### General
* 64-bit
* \>= Windows 10 20H1 2004
#### Scripts - App Installer / Winget minimum version
Script: Require-AppInstallerMinimumVersion.ps1
Output: Boolean
Equals: True

### Upgrade
#### Manually - File exists
Path:  %ProgramW6432%\obs-studio\bin\64bit
File:  obs64.exe
Logic: Exists
#### Script - SSMS is not running
Script: Device_Require-OBSStudioDoesNotRun.ps1
Output: Boolean
Equals: Yes


## Detection
### Install
Path:  %ProgramW6432%\obs-studio\bin\64bit
File:  obs64.exe
Logic: Exists

### Upgrade
Device_Detect-Upgrade_OBSStudioUpgradeAvailableUsingWinget.ps1


## Dependencies
Dependency - Microsoft Visual C++ 2015-2022


## Assignments
### Install
* Available

### Upgrade
* Required
