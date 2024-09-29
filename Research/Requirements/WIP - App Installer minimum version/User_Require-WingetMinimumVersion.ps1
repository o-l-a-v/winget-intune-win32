﻿#Requires -Version 5.1
<#
    .SYNOPSIS
        Requirement script to check minimum version of winget.exe.

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  220305
        Modified: 220307

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
