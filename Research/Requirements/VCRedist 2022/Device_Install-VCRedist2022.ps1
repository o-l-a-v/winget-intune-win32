#Requires -RunAsAdministrator
#Requires -Version 5.1
<#
    .SYNOPSIS
        Installs latest version of VCRedist 2015-2022.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  220305
        Modified: 220305

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>


# Input parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'


# Assets
$InstallParameters = [string] '/quiet /norestart'
$Uris = [ordered]@{
    'ARM64' = [string] 'https://aka.ms/vs/17/release/vc_redist.arm64.exe'
    'x64'   = [string] 'https://aka.ms/vs/17/release/vc_redist.x64.exe'
    'x86'   = [string] 'https://aka.ms/vs/17/release/vc_redist.x86.exe'    
}