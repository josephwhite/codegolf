# Find directory
$scriptDir = $PSScriptRoot
$pesterAgent = [System.IO.Path]::Combine($scriptDir, "utils", "pester-agent.ps1")
$testFolder = [System.IO.Path]::Combine($scriptDir, "tests")

$testFiles = Get-ChildItem -Path $testFolder -Filter "*.Tests.ps1" -File

foreach ($f in $testFiles) {
    $name = ($f.BaseName).split(".")[0]
    $testResultPath = [System.IO.Path]::Combine($testFolder, "results", $name + "-pester-results.xml")
    $testCoveragePath = [System.IO.Path]::Combine($testFolder, "results", $name + "-pester-coverage.xml")
    & $pesterAgent -TestPath $f.FullName -OutputFile $testResultPath -CodeCoverageFile $testCoveragePath
}

exit 0
