# WinGet - Microsoft SQL Server Management Studio - Install parameters

## About

* WinGet package ID: `Microsoft.SQLServerManagementStudio`.

## App information

### Name

#### Install

Microsoft SQL Server Management Studio (SSMS)

#### Upgrade

Upgrade - Microsoft SQL Server Management Studio (SSMS)

### Description

Installs Microsoft SQL Server Management Studio (SSMS).

* **Reboot required after successfull install.**
* Installer is around 700MB => It will take a lot of time to download and install.
* If you get "Requirements not met", or if installer fails => Reboot the computer and try again.
  * If computer has a pending reboot, the installer won't go through.

### Publisher

Microsoft

### App version

Latest from WinGet

## Program

### Install command

#### Install

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Microsoft.SQLServerManagementStudio --locale en-US --override "/install /quiet /norestart" --source winget --accept-package-agreements --accept-source-agreements"
```

#### Upgrade

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id Microsoft.SQLServerManagementStudio --override "/install /quiet /norestart" --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Microsoft.SQLServerManagementStudio --silent --source winget --accept-source-agreements"
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

#### Script - Pending reboot

* Script: [Require-NoPendingReboot](./../../Common/Require-NoPendingReboot.ps1)
* Output: Boolean
* Equals: True

### Upgrade

#### Manually - File exists

* Path: `%ProgramFiles(x86)%\Microsoft SQL Server Management Studio 18\Common7\IDE`
* File: `Ssms.exe`
* Logic: Exists

#### Script - SSMS is not running

* Script: [Device_Require-MicrosoftSQLServerManagementStudioDoesNotRun.ps1](./Device_Require-MicrosoftSQLServerManagementStudioDoesNotRun.ps1)
* Output: Boolean
* Equals: Yes

## Detection

### Install

* Path: `%ProgramFiles(x86)%\Microsoft SQL Server Management Studio 18\Common7\IDE`
* File: `Ssms.exe`
* Logic: Exists

### Upgrade

* [Device_Detect-Upgrade_MicrosoftSQLServerManagementStudioUpgradeAvailableUsingWinget.ps1](./Device_Detect-Upgrade_MicrosoftSQLServerManagementStudioUpgradeAvailableUsingWinget.ps1)

## Dependencies

None

## Assignments

### Install

* Available

### Upgrade

* Required
