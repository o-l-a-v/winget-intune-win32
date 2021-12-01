#Requires -Version 5.1
<#
    .SYNOPSIS
        Detects whether VMWare Horizon View Client runs, returns $false if it does.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  211201
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
            Get-Process -Name 'vmware-view' -ErrorAction 'SilentlyContinue'
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
