BeforeAll {
    $leaf_name = ((Get-Item -Path $PSCommandPath).Name).Replace('.Tests.ps1','.ps1')
    $repo_root_path = (Get-Item -Path $PSCommandPath).Directory.Parent.Fullname
    $script_path = [System.IO.Path]::Combine($repo_root_path, "challenges", $leaf_name)
}
Describe "12hr-to-24hr.ps1" {
    It "Returns <expected> for <date>" -ForEach @(
        @{ Date= "12:00am"; Expected = '0000'}
        @{ Date= "12pm";    Expected = '1200'}
        @{ Date= "12:34Am"; Expected = '0034'}
        @{ Date= "1:34a";   Expected = '0134'}
        @{ Date= "01:34PM"; Expected = '1334'}
        @{ Date= "12:34pm"; Expected = '1234'}
    ) {
        $result = & $script_path -d $Date
        $result | Should -Be $Expected
    }
}
