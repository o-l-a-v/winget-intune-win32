# Winget - Notepad++ - Install parameters
## About
* Winget id: ```Notepad++.Notepad++```.


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
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Notepad++.Notepad++ --silent --source winget --accept-package-agreements --accept-source-agreements"
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id Notepad++.Notepad++ --silent --source winget --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Notepad++.Notepad++ --silent --source winget --accept-source-agreements"

### Behavior
System

### Exit codes
0 = Success


## Requirement
### Both
#### General
* 64 bit
* >= Windows 10 2004 20H1
#### Script
Script: Require-AppInstallerMinimumVersion
Type:   Boolean
Logic:  $true means requirements were met.


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
Dependency - Microsoft Visual C++ 2015-2022


## Assignments
### Install
* Available

### Upgrade
* Required