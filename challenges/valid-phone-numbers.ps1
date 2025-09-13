param($f="file.txt")
foreach($l in gc $f){
    if($l -match '^(\d{3}-|\(\d{3}\) )\d{3}-\d{4}$'){$l}
}