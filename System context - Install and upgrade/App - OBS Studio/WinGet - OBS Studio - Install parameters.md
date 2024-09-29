# WinGet - OBS Studio - Install parameters

## About

* WinGet package ID: `OBSProject.OBSStudio`.
* Creates a desktop shortcut by default.

## App information

### Name

#### Install

OBS Studio

#### Upgrade

Upgrade - OBS Studio

### Description

OBS Studio

### Publisher

OBS Project

### App version

Latest from WinGet

## Program

### Install command

#### Install

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id OBSProject.OBSStudio --silent --source winget --accept-package-agreements --accept-source-agreements && del "%PUBLIC%\Desktop\OBS Studio.lnk""
```

#### Upgrade

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id OBSProject.OBSStudio --silent --source winget --accept-package-agreements --accept-source-agreements && del "%PUBLIC%\Desktop\OBS Studio.lnk""
```

### Uninstall command

#### WinGet

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id OBSProject.OBSStudio --silent --source winget --accept-source-agreements"
```

#### Native

```bat
cmd /c ""%ProgramW6432%\obs-studio\uninstall.exe" /S"
```

### Behavior

System

## Requirements

### Both

#### General

* 64-bit
* \>= Windows 10 20H1 2004

#### Script - App Installer / WinGet minimum version

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Output:** Boolean
* **Equals:** Yes

### Upgrade

#### Manually - File exists

* **Path:** `%ProgramW6432%\obs-studio\bin\64bit`
* **File:** `obs64.exe`
* **Logic:** Exists

#### Script - SSMS is not running

* **Script:** [Device_Require-OBSStudioDoesNotRun.ps1](./Device_Require-OBSStudioDoesNotRun.ps1)
* **Output:** Boolean
* **Equals:** Yes

## Detection

### Install

* **Path:** `%ProgramW6432%\obs-studio\bin\64bit`
* **File:** `obs64.exe`
* **Logic:** Exists

### Upgrade

[Device_Detect-Upgrade_OBSStudioUpgradeAvailable_UsingWinget.ps1](./Device_Detect-Upgrade_OBSStudioUpgradeAvailable_UsingWinget.ps1)

## Dependencies

None

## Assignments

### Install

* Available

### Upgrade

* Required
