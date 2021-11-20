#Requires -RunAsAdministrator
#Requires -Version 5.1
<#
    .SYNOPSIS
        Uses Winget to see if a new version is available for PowerToys.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  211120
        Modified: 211120

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>


# Inpup parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


# Assets
## Scenario specific
$FileDetectPath  = [string] '{0}\PowerToys\PowerToys.exe' -f $env:ProgramW6432
$WingetId        = [string] 'Microsoft.PowerToys'

## Generic
$WingetPushdPath = [string] '{0}\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe' -f $env:ProgramW6432


# Check if installed, exit 0 if not
if (-not [System.IO.File]::Exists($FileDetectPath)) {
    Write-Output -InputObject 'Not installed, so no upgrade available.'
    Exit 0
}


# Check if update available - Only works from system context
Set-Location -Path $WingetPushdPath
$WingetResult = [string[]](cmd /c ('AppInstallerCLI.exe list {0}'-f$WingetId))


# Check if update was available, exit 0 if not
if ($WingetResult[-3] -like '*available*') {
    Write-Error -ErrorAction 'Continue' -Exception 'Update available.' -Message 'Update available.'
    Exit 1
}
else {
    Write-Output -InputObject 'No update available.'
    Exit 0
}
