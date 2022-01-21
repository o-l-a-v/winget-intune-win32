﻿#Requires -Version 5.1
<#
    .SYNOPSIS
        Uses Winget to see if a new version is available for Microsoft Visual C++ 2015-2022 x64.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  220121
        Modified: 220121

    .EXAMPLE
        & $psISE.CurrentFile.FullPath; $LASTEXITCODE
#>


# Input parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


# Fix winget encoding
$null = cmd /c '' # Workaround for PowerShell ISE "Exception setting "OutputEncoding": "The handle is invalid.""
$Global:OutputEncoding = [Console]::InputEncoding = [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()


# Assets
## Architecture
$Architecture = [string] 'x64'

## Winget Id
$WingetId = [string] 'Microsoft.VC++2015-2022Redist-{0}' -f $Architecture


# Check if old version is installed
$OlderVersion = [bool](
    [byte](
        $(
            Try {
                Get-ItemPropertyValue -Name 'Minor' -Path (
                    'HKEY_LOCAL_MACHINE\SOFTWARE\{0}Microsoft\VisualStudio\14.0\VC\Runtimes\{1}' -f (
                        $(
                            if ([System.Environment]::Is64BitOperatingSystem -and [System.Environment]::Is64BitProcess) {
                                'WOW6432Node\'
                            }
                        ),
                        $Architecture.ToUpper()
                    )
                )
            }
            Catch {
                31
            }
        )
    ) -lt 31
)


# Upgrade available if older version found
if ($OlderVersion) {
    Write-Error -ErrorAction 'Continue' -Exception 'Update available, old version found.' -Message 'Update available, old version found.'
    Exit 1
}


# Winget
## Set $WingetCliPath
$WingetCliPath = [string](
    $(
        if ([System.Security.Principal.WindowsIdentity]::GetCurrent().'User'.'Value' -eq 'S-1-5-18') {
            '{0}\AppInstallerCLI.exe' -f (
                (Get-Item -Path ('{0}\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe' -f $env:ProgramW6432)).'FullName' | Select-Object -First 1
            )
        }
        else {
            '{0}\Microsoft\WindowsApps\winget.exe' -f $env:LOCALAPPDATA
        }
    )
)

## Check if $WingetCli exists
if (-not [System.IO.File]::Exists($WingetCliPath)) {
    Write-Output -InputObject 'Did not find Winget.'
    Exit 0
}

## Check installed version
Write-Information -MessageData '# winget --version'
Write-Information -MessageData (cmd /c ('"{0}" --version' -f $WingetCliPath))


## Check if installed with Winget
### Winget list
$WingetListCommand = [string] '"{0}" list --id {1} --accept-source-agreements' -f $WingetCliPath, $WingetId
$WingetList = [string[]](
    cmd /c $WingetListCommand | Where-Object -FilterScript {
        $_ -like ('*{0}*' -f $WingetId)
    }
)
### View
Write-Information -MessageData ('# {0}' -f $WingetListCommand)
Write-Information -MessageData ($WingetList -join [System.Environment]::NewLine)
### Exit if not installed
if ($WingetList.'Count' -le 0) {
    Write-Output -InputObject 'Not installed, so no upgrade available.'
    Exit 0
}
## Check if upgrade available
### Winget upgrade
$WingetUpgrade = [string[]](
    cmd /c ('"{0}" upgrade' -f $WingetCliPath) | Where-Object -FilterScript {
        $_ -like ('*{0}*' -f $WingetId)
    }
)
### View
Write-Information -MessageData '# winget upgrade'
Write-Information -MessageData ($WingetUpgrade -join [System.Environment]::NewLine)
### Check if update was available, exit 0 if not
if ($WingetUpgrade.'Count' -gt 0) {
    Write-Error -ErrorAction 'Continue' -Exception 'Update available.' -Message 'Update available.'
    Exit 1
}
else {
    Write-Output -InputObject 'No update available.'
    Exit 0
}
