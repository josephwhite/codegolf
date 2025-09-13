BeforeAll {
    $leaf_name = ((Get-Item -Path $PSCommandPath).Name).Replace('.Tests.ps1','.ps1')
    $repo_root_path = (Get-Item -Path $PSCommandPath).Directory.Parent.Fullname
    $script_path = [System.IO.Path]::Combine($repo_root_path, "challenges", $leaf_name)
}
Describe "incremental-game-datetime.ps1" {
   It "Returns <expected> (<Base> to the power of <Exponent>)" -ForEach @(
       @{ Base = 2.00000; Exponent = 10; Expected = 1024.00 }
       @{ Base = 2.10000; Exponent =  3; Expected = 9.26100 }
       @{ Base = 2.00000; Exponent = -2; Expected = 0.25000 }
       @{ Base = 2.00000; Exponent =  0; Expected = 1.00000 }
   ) {
       [double]$result = & $script_path -x $Base -n $Exponent
       $result | Should -BeLikeExactly $Expected
   }
}