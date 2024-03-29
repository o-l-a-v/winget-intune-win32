# Winget - TeamViewer - Install parameters
## About
* Winget id: ```TeamViewer.TeamViewer```.


## App info
### Name
#### Available, Required
TeamViewer
#### Update
Upgrade - TeamViewer

### Description
TeamViewer

### Publisher
TeamViewer

### App version
Latest from Winget


## Program
### Install command
#### Install
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id TeamViewer.TeamViewer --silent --source winget --accept-package-agreements --accept-source-agreements && del "%PUBLIC%\Desktop\TeamViewer.lnk"
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id TeamViewer.TeamViewer --silent --source winget --accept-package-agreements --accept-source-agreements && del "%PUBLIC%\Desktop\TeamViewer.lnk"

### Uninstall command
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id TeamViewer.TeamViewer --silent --source winget --accept-source-agreements"

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
Path:  %ProgramW6432%\TeamViewer
File:  TeamViewer.exe
Logic: Exists.
#### Script
Script: Device_Require-TeamViewerDoesNotRun.ps1
Type:   Boolean
Logic:  $true means not running, which is what we want.


## Detection
### Install
#### Manually -> File
Path:  %ProgramW6432%\TeamViewer
File:  TeamViewer.exe
Logic: Exists.

### Upgrade
#### Script
Device_Detect-Upgrade_TeamViewerUpgradeAvailableUsingWinget.ps1


## Dependencies
Dependency - Microsoft Visual C++ 2015-2022


## Assignment
### Install
* Available

### Upgrade
* Required
