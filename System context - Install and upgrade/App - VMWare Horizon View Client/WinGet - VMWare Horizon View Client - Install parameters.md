# WinGet - VMWare Horizon View Client - Install parameters

## About

* WinGet package ID: `VMware.HorizonClient`.
* Was in Microsoft Store, but was retired.
  * <https://blogs.vmware.com/euc/2020/07/retiring-horizon-client-uwp.html>

## App info

### Name

#### Available, Required

VMWare Horizon View Client

#### Update

Upgrade - VMWare Horizon View Client

### Description

VMWare Horizon View Client

### Publisher

VMWare

### App version

Latest from WinGet

## Program

### Install command

#### Install

##### Default

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id VMware.HorizonClient --silent --source winget --accept-package-agreements --accept-source-agreements"
```

##### Override (replace \<server\>)

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id VMware.HorizonClient --override "/silent /norestart VDM_SERVER=<server> LOGINASCURRENTUSER_DISPLAY=1 LOGINASCURRENTUSER_DEFAULT=1 INSTALL_SFB=0 DESKTOP_SHORTCUT=0 STARTMENU_SHORTCUT=1 AUTO_UPDATE_ENABLED=0 INSTALL_TEAMS_REDIRECTION=1" --source winget --accept-package-agreements --accept-source-agreements"
```

#### Upgrade

##### Default

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id VMware.HorizonClient --silent --source winget --accept-package-agreements --accept-source-agreements"
```

##### Override (replace \<server\>)

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id VMware.HorizonClient --override "/silent /norestart VDM_SERVER=<server> LOGINASCURRENTUSER_DISPLAY=1 LOGINASCURRENTUSER_DEFAULT=1 INSTALL_SFB=0 DESKTOP_SHORTCUT=0 STARTMENU_SHORTCUT=1 AUTO_UPDATE_ENABLED=0 INSTALL_TEAMS_REDIRECTION=1" --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id VMware.HorizonClient --silent --source winget --accept-source-agreements"
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

* **Path:** `%ProgramFiles(x86)%\VMware\VMware Horizon View Client`
* **File:** `vmware-view.exe`
* **Logic:** Exists

#### Script

* **Script:** [Device_Require-VMwareHorizonViewClientDoesNotRun.ps1](./Device_Require-VMWareHorizonViewClientDoesNotRun.ps1)
* **Type:** Boolean
* **Logic:** $true means not running, which is what we want.

## Detection

### Install

#### Manually -> File

* **Path:** `%ProgramFiles(x86)%\VMware\VMware Horizon View Client`
* **File:** `vmware-view.exe`
* **Logic:** Exists

### Upgrade

#### Script

[Device_Detect-Upgrade_VMwareHorizonViewClientUpgradeAvailable_UsingWinget.ps1](./Device_Detect-Upgrade_VMWareHorizonViewClientUpgradeAvailable_UsingWinget.ps1)

## Dependencies

None

## Assignment

### Install

Available

### Upgrade

Required
