# Winget - Jabra Direct - Install parameters
## About
* Winget id: ```Jabra.Direct```


## App information
### Name
#### Install
Jabra Direct
#### Upgrade
Upgrade - Jabra Direct

### Description
Jabra Direct, used for managing Jabra equipment such as headphones.

### Publisher
Jabra

### App version
Latest from Winget


## Program
### Install command
#### Install
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --id Jabra.Direct --silent --accept-package-agreements --accept-source-agreements"
#### Upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --id Jabra.Direct --silent --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "echo "Not added yet.""

### Behavior
System


## Requirements
### Both
* 64 bit
* \>=Windows 10 2004

### Upgrade
#### Manually file
Path:  %ProgramFiles(x86)%\Jabra\Direct4
File:  jabra-direct.exe
Logic: File exists


## Detection
### Install
Path:  %ProgramFiles(x86)%\Jabra\Direct4
File:  jabra-direct.exe
Logic: File exists

### Upgrade
Device_Detect-UpgradeJabraDirectUpgradeAvailableUsingWinget.ps1
