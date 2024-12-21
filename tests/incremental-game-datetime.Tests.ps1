BeforeAll {
     $leaf_name = ((Get-Item -Path $PSCommandPath).Name).Replace('.Tests.ps1','.ps1')
     $repo_root_path = (Get-Item -Path $PSCommandPath).Directory.Parent.Fullname
     $script_path = [System.IO.Path]::Combine($repo_root_path,$leaf_name)
}
Describe "incremental-game-datetime.ps1" {
    It "Returns <expected> (<Seconds> seconds in <Segments> segments)" -ForEach @(
        @{ Seconds = 0      ;Segments = 1; Expected = '0s'                }
        @{ Seconds = 123    ;Segments = 1; Expected = '2m'                }
        @{ Seconds = 123    ;Segments = 2; Expected = '2m 3s'             }
        @{ Seconds = 123    ;Segments = 3; Expected = '2m 3s'             }
        @{ Seconds = 82815  ;Segments = 3; Expected = '23h 0m 15s'        }
        @{ Seconds = 307891 ;Segments = 2; Expected = '3d 13h'            }
        @{ Seconds = 307891 ;Segments = 4; Expected = '3d 13h 31m 31s'    }
        @{ Seconds = 604800 ;Segments = 1; Expected = '1w'                }
        @{ Seconds = 604800 ;Segments = 6; Expected = '1w 0d 0h 0m 0s'    }
        @{ Seconds = 604801 ;Segments = 2; Expected = '1w 0d'             }
        @{ Seconds = 604801 ;Segments = 5; Expected = '1w 0d 0h 0m 1s'    }
        @{ Seconds = 6650819;Segments = 5; Expected = '10w 6d 23h 26m 59s'}
    ) {
        $result = & $script_path -s $Seconds -p $Segments
        $result | Should -Be $Expected
    }
}