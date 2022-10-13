# Winget - GitHub Desktop - Install parameters
## About
* Winget id: ```GitHub.GitHubDesktop```.
* Autoupdates in user context, so no need for update logic.
* Squirrel installer creates desktop shortcut that is hard to get rid of.
  * No install parameter for skip creating desktop shortcut.
  * GitHub Desktop is not actually finished installing when winget-cli says it is.
  * Creates desktop shortcut, to ```%OneDriveCommercial%``` is using OneDrive for Business known folder move.


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
cmd /c ""%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe" install --exact --id GitHub.GitHubDesktop --silent --source winget --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c ""%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe" uninstall --exact --id GitHub.GitHubDesktop --silent --source winget --accept-source-agreements"

### Behavior
User


## Requirements
* 64 bit
* \>= Windows 10 2004 20H1


## Detection
Path:  %LOCALAPPDATA%\GitHubDesktop
File:  GitHubDesktop.exe
Logic: Exists


## Dependencies
Dependency - Microsoft Visual C++ 2015-2022


## Assignment
Available
