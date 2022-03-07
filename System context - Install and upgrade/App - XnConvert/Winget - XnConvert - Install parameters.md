# Winget - XnConvert - Install parameters
## About
* Winget id: XnSoft.XnConvert


## App information
### Name
#### Install
XnConvert
#### Upgrade
Upgrade - XnConvert

### Description
XnConvert

### Publisher
XnSoft

### App version
Latest from Winget


## Program
### Install parameters
#### Install
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --id XnSoft.XnConvert --silent --accept-package-agreements --accept-source-agreements"
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --id XnSoft.XnConvert --silent --accept-package-agreements --accept-source-agreements"

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

#### Upgrade
##### Manually -> File
Path:  %ProgramW6432%\XnConvert
File:  xnconvert.exe
Logic: Exists.

##### Script
Script: Device_Require-XnConvertDoesNotRun.ps1
Type:   Boolean
Logic:  $true means not running, which is what we want.


## Detect
### Install
#### Manually -> File
Path:  %ProgramW6432%\XnConvert
File:  xnconvert.exe
Logic: Exists.
### Upgrade
#### Script
Device_Detect-Upgrade_XnConvertUpgradeAvailableUsingWinget.ps1


## Dependencies
None


## Dependencies
None.


## Assignments
### Install
* Available

### Upgrade
* Required