#Requires -Version 5.1
<#
    .SYNOPSIS
        Detects whether a new enough version of App Installer is installed.

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  220307
        Modified: 220316

    .EXAMPLE
        # Run from this script header with F8 (Run Selection) from PowerShell ISE or VSCode
        & $(Try{$psEditor.GetEditorContext().CurrentFile.Path}Catch{$psISE.CurrentFile.FullPath})
#>


# Input parameters
[OutputType([bool])]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'


# Assets
$MinimumVersion = [System.Version] '1.17.10271.0'


# Detect and exit
$RunningAsSystem = [bool]([System.Security.Principal.WindowsIdentity]::GetCurrent().'User'.'Value' -eq 'S-1-5-18')
$InstalledVersion = [System.Version](
    $(
        Try {
            (Get-AppxPackage -AllUsers:$RunningAsSystem -Name 'Microsoft.DesktopAppInstaller').'Version'
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
