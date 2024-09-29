# WinGet - Git - Install parameters

## About

* WinGet package ID: `Git.Git`.

## App information

### Name

#### Install

Git

#### Upgrade

Upgrade - Git

### Description

Git

### Publisher

Git

### Version

Latest from WinGet

## Program

### Install command

#### Install

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Git.Git --silent --source winget --accept-package-agreements --accept-source-agreements"
```

#### Upgrade

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id Git.Git --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Git.Git --silent --source winget --accept-source-agreements"
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

* **Path:** `%ProgramW6432%\Git`
* **File:** `git-bash.exe`
* **Logic:** Exists

#### Script

* **Script:** [Device_Require-GitDoesNotRun.ps1](./Device_Require-GitDoesNotRun.ps1)
* **Type:** Boolean
* **Logic:** $true means not running, which is what we want.

## Detection

### Install

#### Manually -> Files

* Path: `%ProgramW6432%\Git`
* File: `git-bash.exe`
* Logic: Exists

### Upgrade

#### Script

[Device_Detect-Upgrade_GitUpgradeAvailable_UsingWinget.ps1](./Device_Detect-Upgrade_GitUpgradeAvailable_UsingWinget.ps1)

## Dependencies

None

## Assignment

### Install

* Available

### Upgrade

* Required
