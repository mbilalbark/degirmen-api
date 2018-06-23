<?php 
include ('connection.php');


function login($ad, $mySifre) {
  
  $sql = "SELECT * FROM yonetici WHERE adSoy = '$ad' and sifre = '$mySifre'";
  $result = connect_to_database()->query($sql);
  $count = mysqli_num_rows($result);
  
  if($count==1)
   {  
       return json_encode(array('status' => 200, 'info' => array('adSoy' => $ad, 'sifre' => $mySifre)) );
   }
   else 
     return  json_encode(array('status' => 401));
}




?>