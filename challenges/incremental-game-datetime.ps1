param([int]$s=0,[int]$p=1)
$t=[timespan]::fromseconds($s)
if($t -eq 0){echo "0s";exit}
$z=[ordered]@{w=[math]::Floor($t.Days/7);d=$t.Days % 7;h=$t.Hours;m=$t.Minutes;s=$t.Seconds}
[string]$r = "";$b = $false;
foreach ($i in $z.keys){if ($p -gt 0){if ($z.$i -or $b){$r+="{0}{1} " -f $z.$i,$i;$b=$true;$p--;}}}
echo $r.Trim()