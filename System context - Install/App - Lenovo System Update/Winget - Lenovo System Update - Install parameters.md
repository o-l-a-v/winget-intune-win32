# Winget - Lenovo System Update - Install parameters
## App information
### Name
Lenovo System Update

### Description
Installs Lenovo System Update (LSU).

* ** Please do not install this application unless instructed by IT support.**
* ** Drivers and similar are supposed to be delivered by Windows Update.**

### Publisher
Lenovo

### App version
Latest from Winget


## Program
### Install command
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --id Lenovo.SystemUpdate --silent --accept-package-agreements --accept-source-agreements"

### Uninstall command
"%ProgramFiles(x86)%\Lenovo\System Update\unins000.exe" /VERYSILENT /NORESTART /SUPPRESSMSGBOXES /DELETE

### Behavior
System


## Requirements
### General
* 64-bit
* >= Windows 10 1607
### Manual -> Registry
Path:  HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS
Name:  SystemManufacturer
Logic: String equals
Value: LENOVO
Associated with a 32-bit app on 64-bit clients: No

## Detection
### Manual -> File
Path:  %ProgramFiles(x86)%\Lenovo\System Update
File:  Tvsukernel.exe
Logic: File exists
PS:    (Get-Item -Path ('{0}\Lenovo\System Update\Tvsukernel.exe'-f${env:ProgramFiles(x86)})).VersionInfo.FileVersionRaw.ToString()