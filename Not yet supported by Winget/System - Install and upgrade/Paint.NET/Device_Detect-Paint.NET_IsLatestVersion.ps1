#Requires -Version 5.1
#Requires -RunAsAdministrator
<#
    .SYNOPSIS
        Download and install the latest version of Paint.NET

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  211205
        Modified: 211205

    .EXAMPLE
        & $psISE.CurrentFile.FullPath; $LASTEXITCODE
#>



# Input parameters
[OutputType($null)]
Param()



# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'



# Settings
if ([System.Net.ServicePointManager]::SecurityProtocol.ToString() -ne 'Tls12') {
    [System.Net.ServicePointManager]::SecurityProtocol = 'Tls12'
}



# Assets
$InstalledPath = [string] '{0}\paint.net\paintdotnet.exe' -f $env:ProgramW6432
$VersionInstalled = [System.Version](
    $(
        if ([System.IO.File]::Exists($InstalledPath)) {
            Try {
                $(
                    [array](
                        Get-ChildItem -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
                    )
                ).Where{
                    $_.GetValue('DisplayName') -eq 'paint.net'
                }.ForEach{
                    $_.GetValue('DisplayVersion') -as [System.Version]
                } | Sort-Object -Descending | Select-Object -First 1
            }
            Catch {
                '0.0.0'
            }
        }
        else {
            '0.0.0'
        }
    )
)



# Get latest version from GitHub
Write-Information -MessageData '# Get latest version info from GitHub'
$Latest = [PSCustomObject](
    $(
        Try {
            Invoke-RestMethod -Method 'Get' -Uri 'https://api.github.com/repos/paintdotnet/release/releases/latest'
        }
        Catch {
        }
    )
)



# Exit
## Introduce step
Write-Information -MessageData '# Exit'

## If not installed, exit with 0
if (-not [System.IO.File]::Exists($InstalledPath) -or $VersionInstalled -eq $([System.Version]'0.0.0')) {
    Write-Output -InputObject 'Not installed.'
    Exit 0
}
## Else / if installed
else {
    # Failproof - Check if we found a version from GitHub
    if ([string]::IsNullOrEmpty($Latest.'name')) {
        Write-Output -InputObject 'Failed to get latest version from GitHub - No info on attribute "name".'
        Exit 0
    }
    # Failproof - Check if found version from GitHub can be read as [System.Version]
    if (-not $(Try{$null = $Latest.'name' -as [System.Version]; $?}Catch{$false})) {
        Write-Output -InputObject ('Failed to get latest version from GitHub - Attribute "name" value "{0}" cannot be read as a version.' -f $Latest.'name')
        Exit 0
    }
    # Failproof - Check if we found URL to latest x64 MSI ZIP, if not the installer script will fail
    if ([string]::IsNullOrEmpty($Latest.'assets'.Where{$_.'name' -like '*.winmsi.x64.zip'}.'browser_download_url')) {
        Write-Output -InputObject 'Failed to get latest version from GitHub - Download URL for latest x64 MSI ZIP was not found.'
        Exit 0
    }
    # Actually check if latest version is the newest one
    if ($VersionInstalled -ge $([System.Version]$Latest.'name')) {
        Write-Output -InputObject (
            'Installed version "{0}" is greater than or equal to latest version from GitHub "{1}".' -f (
                $VersionInstalled.ToString(),
                $Latest.'name'
            )
        )
        Exit 0
    }
    else {
        Write-Error -ErrorAction 'Continue' -Exception (
            'Installed version "{0}" is less than latest version from GitHub "{1}".' -f (
                $VersionInstalled.ToString(),
                $Latest.'name'
            )
        )
        Exit 1
    }
}
