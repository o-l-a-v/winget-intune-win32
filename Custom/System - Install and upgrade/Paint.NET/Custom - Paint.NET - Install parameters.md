# Custom - Paint.NET - Install parameters

> [!TIP]
> Paint.NET is now in Microsoft Store with package ID `dotPDN.PaintDotNet`, this custom logic isn't needed anymore.

## About

* WinGet package ID: `dotPDN.PaintDotNet`.
* Why custom?
  * Was not in `winget-pkgs` because WinGet CLI did not support installers inside `.zip` until WinGet CLI v1.4.

## App information

### Name

#### Install

Paint.NET

#### Upgrade

Upgrade - Paint.NET

### Description

Paint.NET

### Publisher

Rick Brewster

### Version

Latest from GitHub

### Project

<https://github.com/paintdotnet/release>

## Program

### Install command

```bat
"%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy "Bypass" -NoLogo -NonInteractive -NoProfile -WindowStyle "Hidden" -Command "& '.\Device_Install-Paint.NET_LatestVersion.ps1'; exit $LASTEXITCODE"
```

### Uninstall command

```bat
"%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy "Bypass" -NoLogo -NonInteractive -NoProfile -WindowStyle "Hidden" -Command "& '.\Device_Uninstall-Paint.NET_AnyVersion'; exit $LASTEXITCODE"
```

### Behavior

System

## Requiresments

### Any scenario

* 64 bit
* \>= Windows 10 2004 20H1

### Upgrade

#### Manually -> File

* **Path:** `%ProgramW6432%\paint.net`
* **File:** `paintdotnet.exe`
* **Logic:** Exists

#### Script

[Device_Require-Paint.NET_DoesNotRun.ps1](./Device_Require-Paint.NET_DoesNotRun.ps1)

## Detection

### Install

#### Manually -> File

* **Path:** `%ProgramW6432%\paint.net`
* **File:** `paintdotnet.exe`
* **Logic:** Exists

### Upgrade

#### Script

[Device_Detect-Paint.NET_IsLatestVersion.ps1](./Device_Detect-Paint.NET_IsLatestVersion.ps1)

## Dependencies

None

## Assignment

### Install

Available

### Upgrade

Required
