<?php

include ("PHPSonos.inc.php"); 

$sonos = new PHPSonos("192.168.1.144");
$sonos->ClearQueue(); 
$sonos->AddToQueue("http://192.168.1.141/bustime.mp3");
$sonos->SetQueue("x-rincon-queue:RINCON_"."000E58215CE4"."01400#0");
$sonos->Play();

echo "done"

?>
