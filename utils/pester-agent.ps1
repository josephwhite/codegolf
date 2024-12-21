<#
    .SYNOPSIS
    Run Pester test
    .PARAMETER TestPath
    Path of .Tests.ps1 file.
    .PARAMETER OutputFile
    Path to write the Pester test results to.
    .PARAMETER CodeCoverageFile
    Path to write the Pester code coverage results to.
    .EXAMPLE
    .\pester-agent.ps1 -TestPath "C:\repos\foo\tests\thing.Tests.ps1" -OutputFile "C:\repos\foo\tests\output\thing-pester-results.xml"
    .EXAMPLE
    .\pester-agent.ps1 -TestPath "C:\repos\foo\tests\thing.Tests.ps1" -OutputFile "C:\repos\foo\tests\output\thing-pester-results.xml" -CodeCoverageFile "C:\repos\foo\tests\output\thing-pester-coverage.xml"
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [String]
    $TestPath,

    [Parameter(Mandatory)]
    [String]
    $OutputFile,

    [Parameter()]
    [AllowEmptyString()]
    [String]
    $CodeCoverageFile
)

$pesterconfig = New-PesterConfiguration
$pesterconfig.Output.Verbosity = 'Detailed'
$pesterconfig.Run.Path = $TestPath
$pesterconfig.TestResult.Enabled = $true
$pesterconfig.TestResult.OutputPath = $OutputFile
$pesterconfig.TestResult.OutputFormat = 'NUnitXml'
if ($CodeCoverageFile) {
    $pesterconfig.CodeCoverage.Enabled = $true
    $pesterconfig.CodeCoverage.OutputPath = $CodeCoverageFile
    $pesterconfig.CodeCoverage.CoveragePercentTarget = 75
}

Invoke-Pester -Configuration $pesterconfig
