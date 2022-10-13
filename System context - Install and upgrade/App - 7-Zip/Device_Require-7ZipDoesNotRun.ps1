#Requires -Version 5.1
<#
    .SYNOPSIS
        Detects whether 7-Zip runs, returns $false if it does.

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  211121
        Modified: 211201

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
        & $psISE.CurrentFile.FullPath -Testing
#>


# Input parameters
[OutputType([bool])]
Param(
    [Parameter(HelpMessage = 'Enabling this breaks Intune Win32 requirement script, so it is off by default.')]
    [switch] $Testing
)


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = $(if($Testing){'Continue'}else{'SilentlyContinue'})


# Check if running
if (
    $(
        [array](
            Get-Process -Name '7z*' -ErrorAction 'SilentlyContinue'
        )
    ).'Count' -le 0
) {
    Write-Information -MessageData 'Not currently running.'
    $true
}
else {
    Write-Information -MessageData 'Currently running.'
    $false
}
