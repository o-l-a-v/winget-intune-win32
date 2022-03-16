# Winget - Discord - Install parameters
## About
* Winget id: ```Discord.Discord```.
* Autoupdates in user context, so no need for update logic.
* Creates a desktop icon in user profile that is hard to remove without custom logic.
  * Can be in OneDrive if using Known Folder Move.
  * No environmental variable available in CMD to get current desktop path for current user.
  * Thus using PowerShell to remove it the install command.


## App information
### Name
Discord

### Description
Discord

### Publisher
Discord

### App version
Latest from Winget


## Program
### Install command
cmd /c ""%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe" install --id Discord.Discord --silent --accept-package-agreements --accept-source-agreements && powershell -c ([System.IO.File]::Delete(('{0}\Discord.lnk'-f[System.Environment]::GetFolderPath('Desktop'))))"

### Uninstall command
cmd /c ""%LOCALAPPDATA%\Discord\Update.exe" --uninstall -s"

### Behavior
User


## Requirements
* 64 bit
* \>= Windows 10 2004 20H1


## Detection
### Manually - File
Path:  %LOCALAPPDATA%\Discord
File:  Update.exe
Logic: Exists

### Manually - Registry
Path:  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall\Discord
Name:  Discord
Logic: String equals
Value: Discord


## Dependencies
None


## Assignment
Available
