# Winget - Microsoft .NET Core Desktop Runtime 3.1.x x64 - Install parameters.md
## About
* Winget package id: ```Microsoft.DotNet.Runtime.3_1```.
  * Was: ```Microsoft.dotnetRuntime.3-x64```
* Kept up to date by Windows Update.


## App information
### Name
Dependency - Microsoft .NET Core Desktop Runtime 3.1.x x64

### Descripotion
Microsoft .NET Desktop Core Runtime 3.1.x x64

### Publisher
Microsoft

### App version
Latest from Winget


## Program
### Install command
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Microsoft.DotNet.Runtime.3_1 --silent --source winget --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Microsoft.DotNet.Runtime.3_1 --silent --source winget --accept-source-agreements"

### Behavior
System


## Requirements
### General
* 64 bit
* \>= Windows 10 2004 / 20H1

### Script
Require-AppInstallerMinimumVersion.ps1


## Detection
### Script
Device_Detect-Dependency_MicrosoftNetCoreDesktopRuntime3_UsingWinget.ps1


## Dependencies
Dependency - Microsoft Visual C++ 2015-2022


## Assignments
Don't assign.
