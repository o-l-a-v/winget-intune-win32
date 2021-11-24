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
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && AppInstallerCLI.exe install --id XnSoft.XnViewMP --silent --accept-package-agreements --accept-source-agreements"
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && AppInstallerCLI.exe upgrade --id XnSoft.XnViewMP --silent --accept-package-agreements --accept-source-agreements"

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
None


## Dependencies
None.


## Assignments
### Install
* Available

### Upgrade
* Required