#Requires -Version 5.1
<#
    .SYNOPSIS
        Requirement script to check minimum version of winget.exe.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  220305
        Modified: 220305

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>


# Input parameters
[OuputType([bool])]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'


# Assets
$MinimumVersion = [System.Version] '1.2.10271'


# Get installed version
$InstalledVersion = [System.Version](
    $(
        Try {
            (cmd /c 'winget --version').Replace('v','')
        }
        Catch {
            '0.0.0'
        }
    )
)


# Compare
if ($InstalledVersion -ge $MinimumVersion) {
    $true
}
else {
    $false
}
