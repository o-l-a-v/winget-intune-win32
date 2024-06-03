# WinGet - Notepad++ - Install parameters

## About

* WinGet package ID: `Notepad++.Notepad++`.

## App information

### Name

#### Available, Required

Notepad++

#### Upgrade

Upgrade - Notepad++

### Description

Notepad++

### Publisher

Notepad++

### App version

Latest from WinGet

## Program

### Install parameters

#### Install

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Notepad++.Notepad++ --silent --source winget --accept-package-agreements --accept-source-agreements"
```

#### Upgrade

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id Notepad++.Notepad++ --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Notepad++.Notepad++ --silent --source winget --accept-source-agreements"
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

#### Script

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Type:** Boolean
* **Logic:** $true means requirements were met

### Upgrade

#### Manually -> File

* **Path:** `%ProgramW6432%\Notepad++`
* **File:** `notepad++.exe`
* **Logic:** Exists

#### Script

* **Script:** [Device_Require-Notepad++DoesNotRun.ps1](./Device_Require-Notepad++DoesNotRun.ps1)
* **Type:** Boolean
* **Logic:**  $true means not running, which is what we want

## Detection

### Install

#### Manually -> File

* **Path:** `%ProgramW6432%\Notepad++`
* **File:** `notepad++.exe`
* **Logic:** Exists

### Upgrade

[Device_Detect-Upgrade_Notepad++UpgradeAvailableUsingWinget.ps1](Device_Detect-Upgrade_Notepad++UpgradeAvailable_UsingWinget.ps1)

## Dependencies

Dependency - Microsoft Visual C++ 2015-2022

## Assignments

### Install

* Available

### Upgrade

* Required
