# WinGet - Microsoft PowerToys - Install commands

## About

* WinGet package ID: `Microsoft.PowerToys`.
* ID in Microsoft Store: `XP89DCGQ3K6VLD`.
  * Not using this because Microsoft Store is notorious for lagging behind on new versions because of the lengthy approval process.

## App info

### Name

#### Install

Microsoft PowerToys

#### Upgrade

Upgrade - Microsoft PowerToys

### Description

Microsoft PowerToys

### Publisher

Microsoft

### App version

Latest from WinGet

## Program

### Install command

#### Install

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Microsoft.PowerToys --scope machine --silent --source winget --accept-package-agreements --accept-source-agreements"
```

#### Upgrade

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id Microsoft.PowerToys --silent --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Microsoft.PowerToys --silent --source winget --accept-source-agreements"
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

### Upgrade

#### Manually -> File

* **Path:** `%ProgramW6432%\PowerToys`
* **File:** `PowerToys.exe`
* **Logic:** Exists

## Detection

### Install

#### Manually -> File

* **Path:** `%ProgramW6432%\PowerToys`
* **File:** `PowerToys.exe`
* **Logic:** Exists

### Upgrade

#### PowerShell

[Device_Detect-Upgrade_MicrosoftPowerToysUpgradeAvailable_UsingWinget.ps1](./Device_Detect-Upgrade_MicrosoftPowerToysUpgradeAvailable_UsingWinget.ps1)

#### If CMD was an option

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && AppInstallerCLI.exe list Microsoft.PowerToys | find /i "available""
```

## Dependencies

None

## Assignment

### Install

Available

### Upgrade

Required
