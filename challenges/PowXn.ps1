param([double]$x,[int]$n)
if($n -lt 0){$s=$true;[long]$e=-$n}else{$s=$false;[long]$e=$n}
$r=1.0
while($e) {
    if($e -band 1){$r*=$x}
    $e=$e -shr 1;$x*=$x
}
if($s){$r=1/$r}
return $r