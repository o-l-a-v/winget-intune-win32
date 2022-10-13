# Winget - Postman - Install parameters
## About
* Winget id: ```Postman.Postman```.
* Autoupdates in user context, so no need for update logic.
* Creates a desktop icon in user profile that is hard to remove without custom logic.
  * Can be in OneDrive if using Known Folder Move.
  * No environmental variable available in CMD to get current desktop path for current user.
  * Thus using PowerShell to remove it the install command.


## App information
### Name
Postman

### Description
Postman

### Publisher
Postman

### App version
Latest from Winget


## Program
### Install command
cmd /c ""%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe" install --exact --id Postman.Postman --silent --source winget --accept-package-agreements --accept-source-agreements && powershell -c ([System.IO.File]::Delete(('{0}\Postman.lnk'-f[System.Environment]::GetFolderPath('Desktop'))))"

### Uninstall command
#### Winget
cmd /c ""%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe" uninstall --exact --id Postman.Postman --silent --source winget --accept-source-agreements
#### Native
cmd /c ""%LOCALAPPDATA%\Postman\Update.exe" --uninstall -s"

### Behavior
User


## Requirements
* 64 bit
* \>= Windows 10 2004 20H1


## Detection
Path:  %LOCALAPPDATA%\Postman
File:  Postman.exe
Logic: Exists


## Dependencies
None


## Assignment
Available
