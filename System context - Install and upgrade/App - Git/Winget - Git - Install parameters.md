# Winget - Git - Install parameters
## About
* Winget id: Git.Git


## App information
### Name
#### Install
Git
#### Upgrade
Upgrade - Git

### Description
Git

### Publisher
Git

### Version
Latest from Winget


## Program
### Install command
#### Install
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --id Git.Git --silent --accept-package-agreements --accept-source-agreements"
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --id Git.Git --silent --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "echo "Not added yet.""


## Requiresments
### All scenarios
* 64-bit
* >= Windows 10 2004 20H1

### Upgrade
#### Manually -> File
Path:  %ProgramW6432%\Git
File:  git-bash.exe
Logic: Exists.
#### Script
Script: Device_Require-GitDoesNotRun.ps1
Type:   Boolean
Logic:  $true means not running, which is what we want.


## Detection
### Install
#### Manually -> Files
Path:  %ProgramW6432%\Git
File:  git-bash.exe
Logic: Exists.

### Upgrade
#### Script
Device_Detect-Upgrade_GitUpgradeAvailableUsingWinget.ps1


## Dependencies
None.


## Assignment
### Install
* Available

### Upgrade
* Required
