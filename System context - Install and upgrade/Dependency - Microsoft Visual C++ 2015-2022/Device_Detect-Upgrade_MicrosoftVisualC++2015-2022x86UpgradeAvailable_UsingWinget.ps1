#Requires -Version 5.1
<#
    .SYNOPSIS
        Uses Winget to see if a new version is available for Microsoft Visual C++ 2015-2022 x86.

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  220121
        Modified: 221013

    .EXAMPLE
        & $psISE.CurrentFile.FullPath; $LASTEXITCODE
#>



# Input parameters
[OutputType($null)]
Param()



# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'



# Fix winget encoding
$null = cmd /c '' # Workaround for PowerShell ISE "Exception setting "OutputEncoding": "The handle is invalid.""
$Global:OutputEncoding = [Console]::InputEncoding = [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()



# Assets
## Scenario specific
$WingetPackageId = [string] 'Microsoft.VCRedist.2015+.x86'


## Find winget-cli
### Find directory
$WingetDirectory = [string](
    $(
        if ([System.Security.Principal.WindowsIdentity]::GetCurrent().'User'.'Value' -eq 'S-1-5-18') {
            (Get-Item -Path ('{0}\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe' -f $env:ProgramW6432)).'FullName' | Select-Object -First 1                
        }
        else {
            '{0}\Microsoft\WindowsApps' -f $env:LOCALAPPDATA
        }
    )
)

### Find file name
$WingetCliFileName = [string](
    $(
        [string[]](
            'AppInstallerCLI.exe',
            'winget.exe'
        )
    ).Where{
        [System.IO.File]::Exists(
            ('{0}\{1}' -f $WingetDirectory, $_)
        )
    } | Select-Object -First 1
)

### Combine and file name
$WingetCliPath = [string] '{0}\{1}' -f $WingetDirectory, $WingetCliFileName


## Check Winget version
Write-Information -MessageData '# winget --version'
Write-Information -MessageData (cmd /c ('"{0}" --version' -f $WingetCliPath))


# Check if old version is installed
$OlderVersion = [bool](
    [byte](
        $(
            Try {
                Get-ItemPropertyValue -Name 'Minor' -Path (
                    'HKEY_LOCAL_MACHINE\SOFTWARE\{0}Microsoft\VisualStudio\14.0\VC\Runtimes\{1}' -f (
                        $(
                            if ([System.Environment]::Is64BitOperatingSystem -and [System.Environment]::Is64BitProcess) {
                                'WOW6432Node\'
                            }
                        ),
                        $Architecture.ToUpper()
                    )
                )
            }
            Catch {
                31
            }
        )
    ) -lt 31
)



# Upgrade available if older version found
if ($OlderVersion) {
    Write-Error -ErrorAction 'Continue' -Exception 'Update available, old version found.' -Message 'Update available, old version found.'
    Exit 1
}



# Winget
## Check if installed with Winget
### Winget list
$WingetListCommand = [string] '"{0}" list --exact --id {1} --source winget --accept-source-agreements' -f $WingetCliPath, $WingetPackageId
$WingetList = [string[]](
    cmd /c $WingetListCommand | Where-Object -FilterScript {
        $_ -like ('*{0}*' -f $WingetPackageId)
    }
)

### View
Write-Information -MessageData ('# {0}' -f $WingetListCommand)
Write-Information -MessageData ($WingetList -join [System.Environment]::NewLine)

### Exit if not installed
if ($WingetList.'Count' -le 0) {
    Write-Output -InputObject 'Not installed, so no upgrade available.'
    Exit 0
}


## Check if upgrade available
### Winget upgrade
$WingetUpgrade = [string[]](
    cmd /c ('"{0}" upgrade' -f $WingetCliPath) | Where-Object -FilterScript {
        $_ -like ('*{0}*' -f $WingetPackageId)
    }
)

### View
Write-Information -MessageData '# winget upgrade'
Write-Information -MessageData ($WingetUpgrade -join [System.Environment]::NewLine)

### Check if update was available, exit 0 if not
if ($WingetUpgrade.'Count' -gt 0) {
    Write-Error -ErrorAction 'Continue' -Exception 'Update available.' -Message 'Update available.'
    Exit 1
}
else {
    Write-Output -InputObject 'No update available.'
    Exit 0
}
