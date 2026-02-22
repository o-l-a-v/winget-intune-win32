# WinGet - XnConvert - Install parameters

## About

* WinGet package ID: `XnSoft.XnConvert`.

## App information

### Name

#### Install

XnConvert

#### Upgrade

Upgrade - XnConvert

### Description

XnConvert

### Publisher

XnSoft

### App version

Latest from WinGet

## Program

### Install parameters

#### Install

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id XnSoft.XnConvert --silent --source winget --accept-package-agreements --accept-source-agreements"
```

#### Upgrade

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id XnSoft.XnConvert --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id XnSoft.XnConvert --silent --source winget --accept-source-agreements"
```

### Behavior

System

### Exit codes

0 = Success

## Requirement

### Both

#### General

* 64 bit
* \>= Windows 10 2004 20H1

#### Script - App Installer / WinGet minimum version

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Output:** Boolean
* **Equals:** Yes

#### Upgrade

##### Manually -> File

* **Path:** `%ProgramW6432%\XnConvert`
* **File:** `xnconvert.exe`
* **Logic:** Exists

##### Script

* **Script:** [Device_Require-XnConvertDoesNotRun.ps1](./Device_Require-XnConvertDoesNotRun.ps1)
* **Type:** Boolean
* **Logic:** $true means not running, which is what we want

## Detect

### Install

#### Manually -> File

* **Path:** `%ProgramW6432%\XnConvert`
* **File:** `xnconvert.exe`
* **Logic:** Exists

### Upgrade

#### Script

[Device_Detect-Upgrade_XnConvertUpgradeAvailable_UsingWinget.ps1](./Device_Detect-Upgrade_XnConvertUpgradeAvailable_UsingWinget.ps1)

## Dependencies

None

## Assignments

### Install

* Available

### Upgrade

* Required
