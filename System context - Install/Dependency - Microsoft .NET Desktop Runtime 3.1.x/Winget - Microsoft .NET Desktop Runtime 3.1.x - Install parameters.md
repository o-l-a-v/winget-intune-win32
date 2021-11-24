# Winget - Microsoft .NET Desktop Runtime 3.1.x x64 - Install parameters.md
## About
* Id in Winget: Microsoft.dotnetRuntime.3-x64

## App information
### Name
Dependency - Microsoft .NET Desktop Runtime 3.1.x x64

### Descripotion
Microsoft .NET Desktop Runtime 3.1.x x64

### Publisher
Microsoft

### App version
Latest from Winget


## Program
### Install command
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && AppInstallerCLI.exe install --id Microsoft.dotnetRuntime.3-x64 --silent --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "echo "Not added yet.""

### Behavior
System


## Requirements
* 64 bit
* >= Windows 10 2004 / 20H1


## Detection
### Script
Device_Detect-Dependency_MicrosoftNetCoreDesktopRuntime3UsingWinget.ps1


## Dependencies
None


## Assignments
Don't assign.
