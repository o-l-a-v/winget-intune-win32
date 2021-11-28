#Requires -RunAsAdministrator
#Requires -Version 5.1
<#
    .SYNOPSIS
        Update VCRedist using Winget.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  211128
        Modified: 211128

    .EXAMPLE
        & $psISE.CurrentFile.FullPath; $LASTEXITCODE
#>


# Input parameters
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


# Assets
## VCRedist
$VCRedistVersions = [PSCustomObject[]](
    $(
        foreach ($Version in '2005','2008','2010','2012','2013','2015-2019','2015-2022') {
            foreach ($Architecture in 'x86','x64') {
                [PSCustomObject]@{
                    'Architecture' = [string] $Architecture
                    'Version'      = [string] $Version
                    'WingetId'     = [string] 'Microsoft.VC++{0}Redist-{1}' -f $Version, $Architecture
                }                    
            }
        }
    )
)
$VCRedistSpecialCases = [hashtable]@{
    '2015-2019' = '2015-2022'
}

## Winget
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

## Script help variables
$WingetExitCodes = [PSCustomObject[]]@()



# Check what updates are available
$UpdatesAvailable = [string[]](
    cmd /c ('"{0}" upgrade' -f $WingetCliPath)
)



# Add info to VCRedistVersions
foreach ($VCRedistVersion in $VCRedistVersions) {
    $null = Add-Member -InputObject $VCRedistVersion -MemberType 'NoteProperty' -Force -Name 'UpdateAvailable' -Value (
        [bool](
            $UpdatesAvailable.Where{$_ -like ('*{0}*' -f $VCRedistVersion.'WingetId')}.'Count' -gt 0
        )
    )
}



# Exit if no updates
if ($VCRedistVersions.Where{$_.'UpdateAvailable'}.'Count' -le 0) {
    Write-Output -InputObject 'No updates found.'
    Exit 0
}



# Update
foreach ($VCRedistVersion in $VCRedistVersions.Where{$_.'UpdateAvailable'}) {
    Write-Information -MessageData ('# Update available for "{0}"' -f $VCRedistVersion.'WingetId')
    
    # Check for special cases
    ## If not special case, use winget upgrade    
    if ([string]::IsNullOrEmpty($VCRedistSpecialCases.$($VCRedistVersion.'Version'))) {
        Write-Information -MessageData 'No special case defined, upgrading as usual.'
        # Upgrade
        $null = cmd /c (
            '"{0}" upgrade --id {1} --silent --accept-package-agreements --accept-source-agreements' -f (
                $WingetCliPath,
                $VCRedistVersion.'WingetId'
            )
        )
    }
    
    ## Else, use winget install <wanted_version>
    else {
        Write-Information -MessageData (
            'Special case, "{0}" will be upgraded using "{1}".' -f (
                $VCRedistVersion.'Version',
                $VCRedistSpecialCases.$($VCRedistVersion.'Version')
            )
        )
        # Install
        $null = cmd /c (
            '"{0}" install --id {1} --silent --accept-package-agreements --accept-source-agreements' -f (
                $WingetCliPath,
                $VCRedistVersion.'WingetId'.Replace($VCRedistVersion.'Version',$VCRedistSpecialCases.$($VCRedistVersion.'Version'))
            )
        )
    }

    # Add to exit codes
    $WingetExitCodes += [PSCustomObject[]](
        [PSCUstomObject]@{
            'WingetId'      = [string] $VCRedistVersion.'WingetId'
            '$LASTEXITCODE' = [int64] $LASTEXITCODE
            '$?'            = [bool] $_
        }
    )

    # Output success
    Write-Information -MessageData ('$LASTEXITCODE = "{0}", $? = "{1}"' -f $LASTEXITCODE, $?.ToString())    
}



# Exit
if ($WingetExitCodes.Where{$_.'$LASTEXITCODE' -eq 0}.'Count' -eq $VCRedistVersions.Where{$_.'UpdateAvailable'}) {
    Write-Output -InputObject 'Success.'
    Exit 0
}
else {
    Write-Error -ErrorAction 'Failed.'
    Exit 1
}
