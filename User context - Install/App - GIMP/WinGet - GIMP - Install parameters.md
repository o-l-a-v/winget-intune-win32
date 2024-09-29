# WinGet - GIMP - Install parameters

## About

* WinGet package ID: [`GIMP.GIMP`](https://github.com/microsoft/winget-pkgs/tree/master/manifests/g/GIMP/GIMP).
* Can be installed in both user and machine/system context, thus one should specify `--scope <user/machine>` with `winget install`.
* This example convers install only. I'm unsure whether GIMP autodupdates.
* I've not been able to test GIMP from Intune as my [Microsoft 365 Developer Program](https://developer.microsoft.com/en-us/microsoft-365/dev-program) tenant expired.

## App information

### Name

GIMP

### Description

GIMP

### Publisher

GIMP

### App version

Latest from WinGet

### Website

<https://www.gimp.org/>

## Program

### Install command

```bat
cmd /c ""%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe" install --exact --id GIMP.GIMP --scope user --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c ""%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe" uninstall --exact --id GIMP.GIMP --scope user --silent --source winget --accept-source-agreements"
```

### Behavior

User

## Requirements

### General

* \>= Windows 10 2004 20H1

### Script - App Installer / WinGet minimum version

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Output:** Boolean
* **Equals:** Yes

## Detection

* [User_Detect-Install_GIMP_UsingWinGet.ps1](User_Detect-Install_GIMP_UsingWinGet.ps1)

## Dependencies

None

## Assignment

Available
