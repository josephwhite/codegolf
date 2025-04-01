BeforeAll {
    $leaf_name = ((Get-Item -Path $PSCommandPath).Name).Replace('.Tests.ps1','.ps1')
    $repo_root_path = (Get-Item -Path $PSCommandPath).Directory.Parent.Fullname
    $script_path = [System.IO.Path]::Combine($repo_root_path,$leaf_name)
}
Describe "valid-phone-numbers.ps1" {
    It "Returns valid formatted phone numbers" {
        $data = [System.IO.Path]::Combine($repo_root_path, "tests", "data","phone-numbers.txt")
        $result = & $script_path -f $data
        foreach ($res in $result) {
            $res | Should -Match '^(\d{3}-|\(\d{3}\) )\d{3}-\d{4}$'
        }
    }
 }