<?php



function connect_to_database(){
include ('../config/config.php');
   $conn = new mysqli($serverName, $userName, $password, $dbName);
    if ($conn->connect_error) {
        die("Bağlantı Hatali: " . $conn->connect_error);
    }

    return $conn;
}



?>