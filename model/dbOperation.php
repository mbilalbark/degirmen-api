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

function customerAdd($json) {
  
  $sirketAdi = $json['sirketAdi'];
  $bankaAdi =$json['bankaAdi'];
  $hesapNo = $json['hesapNo'];
  $telefon = $json['telefon'];
  $faks = $json['faks'];
  $vergiDairesi = $json['vergiDairesi'];
  $adres = $json['adres'];


  $sql = "INSERT INTO musteri (sirketAdi, bankaAdi, hesapNo, telefon,faks, vergiDairesi, adres,bakiye)
  VALUES ('$sirketAdi','$bankaAdi', '$hesapNo', '$telefon', '$faks', '$vergiDairesi', '$adres',0.3)";
     echo $sql;
   $result = connect_to_database()->query($sql);
   
   if($result)
    {  
        return json_encode(array('status' => 200, 'info' => 'Kayıt Eklenmiştir') );
    }
    else 
      return  json_encode(array('status' => 401));
}


?>