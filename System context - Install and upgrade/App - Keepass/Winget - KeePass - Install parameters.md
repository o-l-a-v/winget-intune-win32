# WinGet - Notepad++ - Install parameters

## About

* WinGet package ID: `DominikReichl.KeePass`.

## Current problems

* Leaves desktop shortcut.
* WinGet installs MSI, not EXE.
  * Install paths:
    * MSI: `%ProgramFiles(x86)%\KeePass2x`.
    * EXE >= v2.50: `%ProgramW6432%\KeePass Password Safe 2`.
    * EXE <= v2.41: `%ProgramFiles(x86)%\KeePass Password Safe 2`.
      * Upgrade installs to "%ProgramW6432%\KeePass Password Safe 2" if it already exists.
  * Caveats:
    * WinGet does not detect existing EXE install.
    * Neither KeePass MSI installer or WinGet handles clean upgrade/install of MSI over EXE.
      * Old EXE install will still exist.
  * Related issues:
    * <https://sourceforge.net/p/keepass/bugs/1811/>.

## App information

### Name

#### Available, Required

KeePass

#### Upgrade

Upgrade - KeePass

### Description

KeePass

### Publisher

KeePass

### App version

Latest from WinGet

## Program

### Install parameters

#### Install

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id DominikReichl.KeePass --silent --source winget --accept-package-agreements --accept-source-agreements"
```

#### Upgrade

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe upgrade --exact --id DominikReichl.KeePass --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id DominikReichl.KeePass --silent --source winget --accept-source-agreements"
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

* **Path:** `%ProgramFiles(x86)%\KeePass2x`
* **File:** `KeePass.exe`
* **Logic:** Exists

#### Script

* **Script:** [Device_Require-KeePassDoesNotRun.ps1](./Device_Require-KeePassDoesNotRun.ps1)
* **Type:** Boolean
* **Logic:** $true means not running, which is what we want

## Detection

### Install

#### Manually -> File

* **Path:** `%ProgramFiles(x86)%\KeePass2x`
* **File:** `KeePass.exe`
* **Logic:** Exists

### Upgrade

[Device_Detect-Upgrade_KeePassUpgradeAvailable_UsingWinget.ps1](./Device_Detect-Upgrade_KeePassUpgradeAvailable_UsingWinget.ps1)

## Dependencies

None

## Assignments

### Install

* Available

### Upgrade

* Required
