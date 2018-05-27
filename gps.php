<?php 

function deg2rad($x) {
  return Math.PI*($x/180);
}
 
function get_distance_m($lat1, $lng1, $lat2, $lng2) {
  $earth_radius = 6378137;   // Terre = sphère de 6378km de rayon
  $rlo1 = deg2rad($lng1);    // CONVERSION
  $rla1 = deg2rad($lat1);
  $rlo2 = deg2rad($lng2);
  $rla2 = deg2rad($lat2);
  $dlo = ($rlo2 - $rlo1) / 2;
  $dla = ($rla2 - $rla1) / 2;
  $a = (Math.sin($dla) * Math.sin($dla)) + Math.cos($rla1) * Math.cos($rla2) * (Math.sin($dlo) * Math.sin($dlo));
  $d = 2 * Math.atan2(Math.sqrt($a), Math.sqrt(1 - $a));
  return ($earth_radius * $d);
}
 ?>
