#Requires -Version 5.1
<#
    .SYNOPSIS
        Detects whether a new enough version of App Installer is installed.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  220306
        Modified: 220306

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>


# Input parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'


# Assets
$MinimumVersion = [System.Version] '1.17.10271.0'


# Detect and exit
if (
    $([System.Version]((Get-AppxPackage -Name 'Microsoft.DesktopAppInstaller').'Version')) -ge $MinimumVersion
) {
    Write-Output -InputObject 'Installed.'
    Exit 0
}
else {
    Write-Error -ErrorAction 'Continue' -Exception 'Not installed.' -Message 'Not installed.'
    Exit 1
}
