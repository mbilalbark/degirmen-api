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
  VALUES ('$sirketAdi','$bankaAdi', '$hesapNo', '$telefon', '$faks', '$vergiDairesi', '$adres',0)";
   $result = connect_to_database()->query($sql);
   
   if($result)
    {  
      return json_encode(array('status' => 200, 'info' => 'Kayıt Eklenmiştir'));
    }
    else 
      return  json_encode(array('status' => 401, 'info' => 'Kayıt Problemlidir'));
}
function customerList() {
  $sql = 'SELECT * FROM musteri WHERE deletedAt="0000-00-00"';
  $result = connect_to_database()->query($sql);
  $i=0;
  
  if($result)
   {
   while( $row = $result->fetch_array(MYSQLI_ASSOC)){
    
    $response[] = $row;
   }
    return json_encode(array('info' => $response));
   }
   else {
    return  json_encode(array('status' => 401, 'info' => 'işlem hatalı'));
   }
}
function customerDelete($id) {
  $d = date("Y-m-d H:i:s");
  $sql ="UPDATE musteri SET deletedAt='$d' WHERE Id='$id'";
  $result = connect_to_database()->query($sql);
  if($result)
  {  
    return json_encode(array('status' => 200, 'info' => 'Kayıt Silinmiştir.'));
  }
  else 
    return  json_encode(array('status' => 401, 'info' => 'Kayıt silinmemiştir.'));
}
?>