# Winget - Microsoft Edge WebView2 Runtime - Install parameters

## About

* WinGet package ID: `Microsoft.EdgeWebView2Runtime`.
* Kept up to date by itself.

## App information

### Name

Dependency - Microsoft Edge WebView 2 Runtime

### Description

Microsoft Edge WebView 2 Runtime

### Publisher

Microsoft

### App version

Latest from Winget

## Program

### Install command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Microsoft.EdgeWebView2Runtime --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Microsoft.EdgeWebView2Runtime --silent --source winget --accept-source-agreements"
```

### Behavior

System

## Requirements

### General

* 64 bit
* \>= Windows 10 2004 / 20H1

### Script - App Installer / WinGet minimum version

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Output:** Boolean
* **Equals:** Yes

## Detection

### Script

[Device_Detect-Dependency_MicrosoftEdgeWebView2Runtime_UsingWinget.ps1](./Device_Detect-Dependency_MicrosoftEdgeWebView2Runtime_UsingWinget.ps1)

## Dependencies

None

## Assignments

Don't assign
