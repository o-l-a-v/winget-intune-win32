# WinGet - Jabra Direct - Install parameters

## About

* WinGet package ID: `Jabra.Direct`.

## App information

### Name

#### Install

Jabra Direct

#### Upgrade

Upgrade - Jabra Direct

### Description

Jabra Direct, used for managing Jabra equipment such as headphones.

### Publisher

Jabra

### App version

Latest from WinGet

## Program

### Install command

#### Install

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Jabra.Direct --silent --source winget --accept-package-agreements --accept-source-agreements"
```

#### Upgrade

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id Jabra.Direct --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Jabra.Direct --silent --source winget --accept-source-agreements"
```

### Behavior

System

## Requirements

### Both

#### General

* 64 bit
* \>=Windows 10 2004

#### Script - App Installer / WinGet minimum version

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Output:** Boolean
* **Equals:** Yes

### Upgrade

#### Manually file

* **Path:** `%ProgramFiles(x86)%\Jabra\Direct6`
* **File:** `jabra-direct.exe`
* **Logic:** File exists

## Detection

### Install

* **Path:** `%ProgramFiles(x86)%\Jabra\Direct6`
* **File:** `jabra-direct.exe`
* **Logic:** File exists

### Upgrade

[Device_Detect-Upgrade_JabraDirectUpgradeAvailable_UsingWinget.ps1](./Device_Detect-Upgrade_JabraDirectUpgradeAvailable_UsingWinget.ps1)

## Dependencies

Dependency - Microsoft Visual C++ 2015-2022
