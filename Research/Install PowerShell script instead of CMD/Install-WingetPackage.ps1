#Requires -Version 5.1
<#
    .SYNOPSIS
        Script for installing apps using winget.

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  220305
        Modified: 220305

    .EXAMPLE
        # Run from this script header with F8 (Run Selection) from PowerShell ISE or VSCode
        & $(Try{$psEditor.GetEditorContext().CurrentFile.Path}Catch{$psISE.CurrentFile.FullPath}) -Id Microsoft.PowerToys -Action Install
#>


# Input parameters
[OutputType($null)]
Param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string] $Id,

    [Parameter()]
    [ValidateSet('Install','Upgrade')]
    [string] $Action
)


# PowerShell preferences
$ErrorActionPreference = 'Stop'


# Assets
## Find winget-cli
### Find directory
$WingetDirectory = [string](
    $(
        if ([System.Security.Principal.WindowsIdentity]::GetCurrent().'User'.'Value' -eq 'S-1-5-18') {
            (Get-Item -Path ('{0}\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe' -f $env:ProgramW6432)).'FullName' | Select-Object -First 1
        }
        else {
            '{0}\Microsoft\WindowsApps' -f $env:LOCALAPPDATA
        }
    )
)
### Find file name
$WingetCliFileName = [string](
    $(
        [string[]](
            'AppInstallerCLI.exe',
            'winget.exe'
        )
    ).Where{
        [System.IO.File]::Exists(
            ('{0}\{1}' -f $WingetDirectory, $_)
        )
    } | Select-Object -First 1
)
### Combine and file name
$WingetPath = [string] '{0}\{1}' -f $WingetDirectory, $WingetCliFileName


# Create command
$ArgumentList = [string[]](
    $Action.ToLower(),
    '--id',
    ('"{0}"' -f $Id),
    '--silent',
    '--accept-package-agreements',
    '--accept-source-agreements'
)


# Start
$Process = Start-Process -FilePath $WingetPath -ArgumentList $ArgumentList -NoNewWindow -Wait -PassThru


# Check success
$Process.'ExitCode'
