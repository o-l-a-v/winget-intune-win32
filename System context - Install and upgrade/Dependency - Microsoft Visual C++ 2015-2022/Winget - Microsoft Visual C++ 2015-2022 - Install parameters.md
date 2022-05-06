# Winget - Microsoft Visual C++ 2015-2022 - Install parameters
## About
* Winget id x64 / 64-bit: ```Microsoft.VC++2015-2022Redist-x64```
* Winget id x86 / 32-bit: ```Microsoft.VC++2015-2022Redist-x86```
* The installer itself handles upgrading/ removing old versions.


## App information
### Name
#### Install
Dependency - Install - Microsoft Visual C++ Runtime 2015-2022 x64
Dependency - Install - Microsoft Visual C++ Runtime 2015-2022 x86
#### Upgrade
Dependency - Upgrade - Microsoft Visual C++ Runtime 2015-2022 x64
Dependency - Upgrade - Microsoft Visual C++ Runtime 2015-2022 x86

### Description
Microsoft Visual C++ Runtime 2015-2022/ v14.

### Publisher
Microsoft

### App version
Latest from Winget


## Program
### Install command
#### x64 (both install and upgrade)
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Microsoft.VC++2015-2022Redist-x64 --silent --accept-package-agreements --accept-source-agreements"
#### x86 (both install and upgrade)
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Microsoft.VC++2015-2022Redist-x86 --silent --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "echo "Not added yet.""

## Behavior
System


## Requirements
### Both
* 64-bit
* \>= Windows 10 2004

### Upgrade
#### x64
Path:  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64
Name:  Version
Logic: Exist
Redirect to x86: Yes
#### x86
Path:  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X86
Name:  Version
Logic: Exist
Redirect to x86: Yes


## Detection
### Install
#### x64
Device_Detect-Install_MicrosoftVisualC++2015-2022x64UsingWinget.ps1
#### x86
Device_Detect-Install_MicrosoftVisualC++2015-2022x86UsingWinget.ps1

### Upgrade
#### x64
Device_Detect-Upgrade_MicrosoftVisualC++2015-2022x64UpgradeAvailableUsingWinget.ps1
#### x86
Device_Detect-Upgrade_MicrosoftVisualC++2015-2022x86UpgradeAvailableUsingWinget.ps1


## Assignments
### Install
* None, use as dependencies for other Win32 apps.

### Upgrade
* All, remember requirement rule will make sure it only installs on