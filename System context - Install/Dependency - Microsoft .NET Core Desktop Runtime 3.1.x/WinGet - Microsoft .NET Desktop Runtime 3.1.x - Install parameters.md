# WinGet - Microsoft .NET Core Desktop Runtime 3.1.x x64 - Install parameters.md

## About

* WinGet package OD: `Microsoft.DotNet.Runtime.3_1`.
  * Was: `Microsoft.dotnetRuntime.3-x64`.
* Kept up to date by Windows Update.

## App information

### Name

Dependency - Microsoft .NET Core Desktop Runtime 3.1.x x64

### Descripotion

Microsoft .NET Desktop Core Runtime 3.1.x x64

### Publisher

Microsoft

### App version

Latest from WinGet

## Program

### Install command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Microsoft.DotNet.Runtime.3_1 --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Microsoft.DotNet.Runtime.3_1 --silent --source winget --accept-source-agreements"
```

### Behavior

System

## Requirements

### General

* 64 bit
* \>= Windows 10 2004 / 20H1

### Script - App Installer / WinGet minimum version

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Output:** Boolean
* **Equals:** Yes

## Detection

### Script

[Device_Detect-Dependency_MicrosoftNetCoreDesktopRuntime3_UsingWinget.ps1](./Device_Detect-Dependency_MicrosoftNetCoreDesktopRuntime3_UsingWinget.ps1)

## Dependencies

None.

## Assignments

Don't assign.
