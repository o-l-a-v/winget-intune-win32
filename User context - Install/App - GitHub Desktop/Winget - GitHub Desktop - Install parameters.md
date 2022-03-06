# Winget - GitHub Desktop - Install parameters
## About
* Winget id: GitHub.GitHubDesktop
* Autoupdates in user context, so no need for update logic.


## App information
### Name
GitHub Desktop

### Description
GitHub Desktop

### Publisher
Microsoft, GitHub

### App version
Latest from Winget


## Program
### Install command
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --id GitHub.GitHubDesktop --silent --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "echo "Not added yet.""

### Behavior
User


## Requirements
* 64 bit
* >= Windows 10 2004 20H1


## Detection
Path:  %LOCALAPPDATA%\GitHubDesktop
File:  GitHubDesktop.exe
Logic: Exists


## Dependencies
None


## Assignment
Available
