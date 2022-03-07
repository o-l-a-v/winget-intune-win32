# Winget - Notepad++ - Install parameters
## About
* Winget id: Notepad++.Notepad++


## App information
### Name
#### Available, Required
Notepad++
#### Upgrade
Upgrade - Notepad++

### Description
Notepad++

### Publisher
Notepad++

### App version
Latest from Winget


## Program
### Install parameters
#### Install
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --id Notepad++.Notepad++ --silent --accept-package-agreements --accept-source-agreements"
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --id Notepad++.Notepad++ --silent --accept-package-agreements --accept-source-agreements"

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
Path:  %ProgramW6432%\Notepad++
File:  notepad++.exe
Logic: Exists.
#### Script
Script: Device_Require-Notepad++DoesNotRun.ps1
Type:   Boolean
Logic:  $true means not running, which is what we want.


## Detection
### Install
#### Manually -> File
Path:  %ProgramW6432%\Notepad++
File:  notepad++.exe
Logic: Exists.

### Upgrade
Device_Detect-Upgrade_Notepad++UpgradeAvailableUsingWinget.ps1


## Dependencies
None.


## Assignments
### Install
* Available

### Upgrade
* Required