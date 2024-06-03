# WinGet - Lenovo System Update - Install parameters

## About

* WinGet package ID: `Lenovo.SystemUpdate`.
* Kept up to date by itself after initial install.

## App information

### Name

Lenovo System Update

### Description

Installs Lenovo System Update (LSU).

* **Please do not install this application unless instructed by IT support.**
* **Drivers and similar are supposed to be delivered by Windows Update.**
* If you get "Requirements not met", open Microsoft Store, go to "Library", and "Check for updates".
  * Must have latest version of the Microsoft app "App Installer".

### Publisher

Lenovo

### App version

Latest from WinGet

## Program

### Install command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Lenovo.SystemUpdate --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

#### WinGet

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Lenovo.SystemUpdate --silent --source winget --accept-source-agreements"
```

#### Native

```bat
"%ProgramFiles(x86)%\Lenovo\System Update\unins000.exe" /VERYSILENT /NORESTART /SUPPRESSMSGBOXES /DELETE
```

### Behavior

System

## Requirements

### General

* 64-bit
* \>= Windows 10 2004 / 20H1

### Script - App Installer / WinGet minimum version

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Output:** Boolean
* **Equals:** Yes

### Manual -> Registry

* **Path:** `HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS`
* **Name:** `SystemManufacturer`
* **Logic:** String equals
* **Value:** `LENOVO`
* **Associated with a 32-bit app on 64-bit clients:** No

## Detection

### Manual -> File

* **Path:** `%ProgramFiles(x86)%\Lenovo\System Update`
* **File:** `Tvsukernel.exe`
* **Logic:** File exists
* **PS:** `(Get-Item -Path ('{0}\Lenovo\System Update\Tvsukernel.exe'-f${env:ProgramFiles(x86)})).VersionInfo.FileVersionRaw.ToString()`

## Dependencies

[Dependency - Microsoft Visual C++ 2015-2022](./../../System%20context%20-%20Install%20and%20upgrade/Dependency%20-%20Microsoft%20Visual%20C++%202015-2022/)
