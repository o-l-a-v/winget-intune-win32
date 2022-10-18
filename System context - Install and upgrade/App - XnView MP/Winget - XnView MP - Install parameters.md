# Winget - XnView MP - Install parameters
## About
* Winget id: XnSoft.XnViewMP


## App information
### Name
#### Install
XnView MP
#### Upgrade
Upgrade - XnView MP

### Description
XnView MP

### Publisher
XnSoft

### App version
Latest from Winget


## Program
### Install parameters
#### Install
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id XnSoft.XnViewMP --silent --source winget --accept-package-agreements --accept-source-agreements"
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id XnSoft.XnViewMP --silent --source winget --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id XnSoft.XnViewMP --silent --source winget --accept-source-agreements"

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
Path:  %ProgramW6432%\XnViewMP
File:  xnviewmp.exe
Logic: Exists.

##### Script
Script: Device_Require-XnViewMPDoesNotRun.ps1
Type:   Boolean
Logic:  $true means not running, which is what we want.


## Detect
### Install
#### Manually -> File
Path:  %ProgramW6432%\XnViewMP
File:  xnviewmp.exe
Logic: Exists.
### Upgrade
#### Script
Device_Detect-Upgrade_XnViewMPUpgradeAvailableUsingWinget.ps1


## Dependencies
Dependency - Microsoft Visual C++ 2015-2022


## Assignments
### Install
* Available

### Upgrade
* Required