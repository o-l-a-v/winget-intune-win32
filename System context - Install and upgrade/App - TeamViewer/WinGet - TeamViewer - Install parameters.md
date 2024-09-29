# WinGet - TeamViewer - Install parameters

## About

* WinGet package ID: `TeamViewer.TeamViewer`.

## App info

### Name

#### Available, Required

TeamViewer

#### Update

Upgrade - TeamViewer

### Description

TeamViewer

### Publisher

TeamViewer

### App version

Latest from WinGet

## Program

### Install command

#### Install

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id TeamViewer.TeamViewer --silent --source winget --accept-package-agreements --accept-source-agreements && del "%PUBLIC%\Desktop\TeamViewer.lnk"
```

#### Upgrade

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id TeamViewer.TeamViewer --silent --source winget --accept-package-agreements --accept-source-agreements && del "%PUBLIC%\Desktop\TeamViewer.lnk"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id TeamViewer.TeamViewer --silent --source winget --accept-source-agreements"
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

* **Path:** `%ProgramW6432%\TeamViewer`
* **File:** `TeamViewer.exe`
* **Logic:** Exists

#### Script

* **Script:** [Device_Require-TeamViewerDoesNotRun.ps1](./Device_Require-TeamViewerDoesNotRun.ps1)
* **Type:** Boolean
* **Logic:** $true means not running, which is what we want

## Detection

### Install

#### Manually -> File

* Path: `%ProgramW6432%\TeamViewer`
* File: `TeamViewer.exe`
* Logic: Exists

### Upgrade

#### Script

[Device_Detect-Upgrade_TeamViewerUpgradeAvailable_UsingWinget.ps1](./Device_Detect-Upgrade_TeamViewerUpgradeAvailable_UsingWinget.ps1)

## Dependencies

None

## Assignment

### Install

* Available

### Upgrade

* Required
