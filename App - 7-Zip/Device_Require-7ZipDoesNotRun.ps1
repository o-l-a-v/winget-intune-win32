#Requires -Version 5.1
<#
    .SYNOPSIS
        Detects whether 7-Zip runs, returns $false if it does.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  211121
        Modified: 211121

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>


# Input parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


# Check if running
if (
    $(
        [array](
            Get-Process -Name '7z*' -ErrorAction 'SilentlyContinue'
        )
    ).'Count' -le 0
) {
    Write-Information -MessageData 'Not currently running.'
    $false
}
else {
    Write-Information -MessageData 'Currently running.'
    $true
}
