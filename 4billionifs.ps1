[uint32]$i=0;$b=$true
while($b){echo "if (($i%2) -eq 0){echo 'even'}else{echo 'odd'}";if($i -lt [uint32]::MaxValue){$i++}else{$b=$false}}