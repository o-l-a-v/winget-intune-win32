# WinGet - Logitech Options - Install parameters

## About

* WinGet package ID: `Logitech.Options`.

## App information

### Name

#### Install

Logitech Options

#### Upgrade

Upgrade - Logitech Options

### Description

Logitech Options

### Publisher

Logitech

### App version

Latest from WinGet

## Program

### Install command

#### Install

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Logitech.Options --silent --source winget --accept-package-agreements --accept-source-agreements"
```

#### Upgrade

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id Logitech.Options --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Logitech.Options --silent --source winget --accept-source-agreements"
```

## Requiresments

### Both

#### General

* 64-bit
* \>= Windows 10 2004 20H1

#### Script - App Installer / WinGet minimum version

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Output:** Boolean
* **Equals:** Yes

### Upgrade

#### Manually -> File

* **Path:** `%ProgramW6432%\Logitech\LogiOptions`
* **File:** `LogiOptions.exe`
* **Logic:** Exists

## Detection

### Install

#### Manually -> Files

* **Path:** `%ProgramW6432%\Logitech\LogiOptions`
* **File:** `LogiOptions.exe`
* **Logic:** Exists

### Upgrade

#### Script

[Device_Detect-Upgrade_LogitechOptionsUpgradeAvailable_UsingWinget.ps1](./Device_Detect-Upgrade_LogitechOptionsUpgradeAvailable_UsingWinget.ps1)

## Dependencies

Dependency - Microsoft Visual C++ 2015-2022

## Assignment

### Install

* Available

### Upgrade

* Required
