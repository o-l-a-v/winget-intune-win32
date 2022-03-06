#Requires -RunAsAdministrator
#Requires -Version 5.1
<#
    .SYNOPSIS
        Installs latest version of App Installer manually.

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
$DownloadDirectory = [string] '{0}\AppInstaller' -f $env:TEMP
$DownloadFiles = [PSCustomObject[]](
    $(
        [string[]](
            'https://aka.ms/Microsoft.VCLibs.x86.14.00.Desktop.appx',
            'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx',
            'https://github.com/microsoft/winget-cli/releases/download/v1.2.10271/b0a0692da1034339b76dce1c298a1e42_License1.xml',
            'https://github.com/microsoft/winget-cli/releases/download/v1.2.10271/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
        )
    ).ForEach{
        [PSCustomObject]@{
            'Uri' = [string] $_
            'FileName' = [string] $_.Split('/')[-1]
            'TargetPath' = [string] '{0}\{1}' -f $DownloadDirectory, $_.Split('/')[-1]
        }
    }
)


# Download
Write-Output -InputObject '# Download'
if (-not [System.IO.Directory]::Exists($DownloadDirectory)) {
    $null = [System.IO.Directory]::CreateDirectory($DownloadDirectory)
}
foreach ($DownloadFile in $DownloadFiles) {
    Write-Output -InputObject $DownloadFile.'FileName'
    if ([System.IO.File]::Exists($DownloadFile.'TargetPath')) {
        $null = [System.IO.File]::Delete($DownloadFile.'TargetPath')
    }
    $null = [System.Net.WebClient]::new().DownloadFile(
        $DownloadFile.'Uri',
        $DownloadFile.'TargetPath'
    )
    Write-Output -InputObject ('$? = "{0}", $LASTEXITCODE = "{1}".' -f $?.ToString(), $LASTEXITCODE)
}


# Install
Write-Output -InputObject '# Install'
$null = Add-AppxProvisionedPackage -Online `
    -PackagePath ($DownloadFiles.'TargetPath'.Where{$_.Split('.')[-1] -eq 'msixbundle'} -as [string]) `
    -LicensePath ($DownloadFiles.'TargetPath'.Where{$_.Split('.')[-1] -eq 'xml'} -as [string]) `
    -DependencyPackagePath ($DownloadFiles.'TargetPath'.Where{$_.Split('.')[-1] -eq 'appx'} -as [string[]])
Write-Output -InputObject ('$? = "{0}", $LASTEXITCODE = "{1}".' -f $?.ToString(), $LASTEXITCODE)


# Exit
Write-Output -InputObject 'Done.'
Exit 0
