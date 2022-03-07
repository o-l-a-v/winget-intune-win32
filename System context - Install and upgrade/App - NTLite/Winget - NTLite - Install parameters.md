# Winget - NTLite - Install parameters
## About
* Winget id: ```Nlitesoft.NTLite```.


## App info
### Name
#### Available, Required
NTLite
#### Update
Upgrade - NTLite

### Description
NTLite

### Publisher
Nlitesoft

### App version
Latest from Winget


## Program
### Install command
#### Install
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --id Nlitesoft.NTLite --silent --accept-package-agreements --accept-source-agreements"
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --id Nlitesoft.NTLite --silent --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "echo "Not added yet.""

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
Path:  %ProgramW6432%\NTLite
File:  NTLite.exe
Logic: Exists.
#### Script
Script: Device_Require-NTLiteDoesNotRun.ps1
Type:   Boolean
Logic:  $true means not running, which is what we want.


## Detection
### Install
#### Manually -> File
Path:  %ProgramW6432%\NTLite
File:  NTLite.exe
Logic: Exists.

### Upgrade
#### Script
Device_Detect-Upgrade_NTLiteUpgradeAvailableUsingWinget.ps1


## Dependencies
None.


## Assignment
### Install
* Available

### Upgrade
* Required
