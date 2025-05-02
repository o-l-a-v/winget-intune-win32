<#
    .SYNOPSIS
        Lint PowerShell files with PSScriptAnalyzer

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  2024-12-20
        Modified: 2024-12-20

    .EXAMPLE
        . $pseditor.GetEditorContext().CurrentFile.Path -FilePaths (Get-ChildItem -File -Recurse -Filter '*.ps1').'FullName'
#>


# Input and expected output
[OutputType([System.Void])]
Param(
    [Parameter(Mandatory)]
    [string[]] $FilePaths,

    [Parameter()]
    [string] $PssaSettingsFile = './PSScriptAnalyzerSettings.psd1'
)


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


# Array list to collect linter findings
$AllFindings = [System.Collections.Generic.List[PSCustomObject]]::new()


# Run PSScriptAnalyzer
foreach ($FilePath in $FilePaths) {
    Write-Information -MessageData ('# {0}' -f $FilePath)
    $Findings = [array](
        PSScriptAnalyzer\Invoke-ScriptAnalyzer -Settings $PssaSettingsFile -Path $FilePath
    )
    if ($Findings.'Count' -gt 0) {
        $Findings | Format-List -Property 'RuleName', 'Severity', 'Line', 'Message'
        $AllFindings.Add(
            [PSCustomObject]@{
                'FilePath' = [string] $FilePath
                'Findings' = $Findings
            }
        )
    }
    else {
        Write-Information -MessageData 'No findings.'
    }
}


# Output total
Write-Information -MessageData '# Total'
Write-Information -MessageData (
    $AllFindings.'Findings'.'Severity' |
        Group-Object -NoElement |
        Sort-Object -Property 'Name' |
        Format-Table |
        Out-String
).Trim()


# Throw if any severity "Error" was found
if ($AllFindings.'Findings'.Where{$_.'Severity' -eq 'Error'}.'Count' -gt 0) {
    Throw 'Findings with severity "Error" was found.'
}
