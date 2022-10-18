# Microsoft VCRedist 2015-2022 - Install parameters
## App information
### Name
Dependency - Microsoft Visual C++ 2015-2022

### Description
Microsoft Visual C++ 2015-2022

### Publisher
Microsoft

### App version
14.x


## Program
### Install command
"%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy "Bypass" -NoLogo -NonInteractive -NoProfile -WindowStyle "Hidden" -Command "& '.\Device_Install-VCRedist20152022.ps1'; exit $LASTEXITCODE"

### Uninstall command
"%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy "Bypass" -NoLogo -NonInteractive -NoProfile -WindowStyle "Hidden" -Command "& '.\Device_Uninstall-VCRedist20152022.ps1'; exit $LASTEXITCODE"

### Behavior
System

### Exit codes
0 = Success
1 = Fail


## Requirements
* x86 and x64
* \>= Windows 10 1607


## Detection
Path:  %windir%\sysnative
File:  concrt140.dll
Logic: File exists


## Dependencies
None


## Assignments
None, use as dependency for other Winget Win32 apps.
