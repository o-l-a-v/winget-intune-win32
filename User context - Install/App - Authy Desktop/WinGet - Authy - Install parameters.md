# WinGet - Authy Desktop - Install parameters

## About

* WinGet package ID: `Twilio.Authy`.
* Autoupdates in user context, so no need for update logic.
* Squirrel installer creates desktop shortcut that is hard to get rid of.
  * No install parameter for skip creating desktop shortcut.
  * GitHub Desktop is not actually finished installing when winget-cli says it is.
  * Creates desktop shortcut, to `%OneDriveCommercial%` is using OneDrive for Business known folder move.

## App information

### Name

Authy Desktop

### Description

Authy Desktop

### Publisher

Twilio

### App version

Latest from WinGet

## Program

### Install command

```bat
cmd /c ""%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe" install --exact --id Twilio.Authy --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c ""%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe" uninstall --exact --id Twilio.Authy --silent --source winget --accept-source-agreements"
```

### Behavior

User

## Requirements

### General

* 64 bit
* \>= Windows 10 2004 20H1

### Script - App Installer / WinGet minimum version

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Output:** Boolean
* **Equals:** Yes

## Detection

* **Path:** `%LOCALAPPDATA%\authy`
* **File:** `Authy Desktop.exe`
* **Logic:** Exists

## Dependencies

None

## Assignment

Available
