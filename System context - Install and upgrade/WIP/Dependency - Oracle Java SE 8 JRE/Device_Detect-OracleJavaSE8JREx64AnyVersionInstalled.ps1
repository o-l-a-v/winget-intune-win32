#Requires -Version 5.1
<#
    .SYNOPSIS
        Checks if any Oracle Java SE 8 JRE x64 is installed.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  220120
        Modified: 220120

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>


# Input parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


# Start as x64 if running as x86
if ([System.Environment]::Is64BitOperatingSystem -and -not [System.Environment]::Is64BitProcess) {
    $null = Set-ExecutionPolicy -Scope 'Process' -ExecutionPolicy 'Bypass' -Force
    & ('{0}\sysnative\WindowsPowerShell\v1.0\powershell.exe' -f $env:windir) -File ('"{0}"' -f $MyInvocation.'MyCommand'.'Path') -NonInteractive -NoProfile
    exit $LASTEXITCODE
}


# Detect
if (
    $(
        [array](
            Get-ChildItem -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
        )
    ).Where{
        $_.GetValue('DisplayName') -like 'Java 8*' -and
        $_.GetValue('InstallLocation') -like '*\jre*'
    }.'Count' -gt 0
) {
    Write-Output -InputObject 'Detected.'
    Exit 0
}
else {
    Write-Error -ErrorAction 'Continue' -ErrorRecord 'Not detected.' -Message 'Not detected.'
}
