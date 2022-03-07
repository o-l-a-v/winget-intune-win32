#Requires -Version 5.1
<#
    .SYNOPSIS
        Detects whether a new enough version of App Installer is installed.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  220307
        Modified: 220307

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>


# Input parameters
[OutputType([bool])]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'


# Assets
$MinimumVersion = [System.Version] '1.17.10271.0'


# Detect and exit
$InstalledVersion = [System.Version](
    $(
        Try {
            if ([System.Security.Principal.WindowsIdentity]::GetCurrent().'User'.'Value' -eq 'S-1-5-18') {
                $(
                    [string](
                        (Get-Item -Path ('{0}\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe' -f $env:ProgramW6432)).'FullName' | Select-Object -First 1
                    )
                ).Split('_')[-4]
            }
            else {
                (Get-AppxPackage -Name 'Microsoft.DesktopAppInstaller').'Version'
            }
        }
        Catch {
            '0.0.0'
        }
    )
)


# Return results
[bool](
    $InstalledVersion -ge $MinimumVersion
)
