# WinGet - NTLite - Install parameters

## About

* WinGet package ID: `Nlitesoft.NTLite`.
* Known problems:
  * Installer URL is static, new versions are uploaded but not added to `winget-pkgs` at the same time, which often creates checksum mismatch.

## App info

### Name

#### Available, Required

NTLite

#### Update

Upgrade - NTLite

### Description

NTLite

### Publisher

Nlitesoft

### App version

Latest from WinGet

## Program

### Install command

#### Install

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Nlitesoft.NTLite --silent --source winget --accept-package-agreements --accept-source-agreements"
```

#### Upgrade

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id Nlitesoft.NTLite --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Nlitesoft.NTLite --silent --source winget --accept-source-agreements"
```

### Behavior

System

### Exit codes

0 = Success

## Requirements

### Both

#### General

* 64 bit
* \>= Windows 10 2004 20H1

#### Script - App Installer / WinGet minimum version

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Output:** Boolean
* **Equals:** Yes

### Upgrade

#### Manually -> File

* **Path:** `%ProgramW6432%\NTLite`
* **File:** `NTLite.exe`
* **Logic:** Exists

#### Script

* **Script:** `Device_Require-NTLiteDoesNotRun.ps1`
* **Type:** Boolean
* **Logic:** $true means not running, which is what we want

## Detection

### Install

#### Manually -> File

* **Path:** `%ProgramW6432%\NTLite`
* **File:** `NTLite.exe`
* **Logic:** Exists

### Upgrade

#### Script

[Device_Detect-Upgrade_NTLiteUpgradeAvailable_UsingWinget.ps1](./Device_Detect-Upgrade_NTLiteUpgradeAvailable_UsingWinget.ps1)

## Dependencies

None

## Assignment

### Install

* Available

### Upgrade

* Required
