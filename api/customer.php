<?php 
header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Headers Origin, X-Requested-With, Content-Type, Accept");
include_once '../model/dbOperation.php';


$content = file_get_contents("php://input");

$decoded = json_decode($content, true);

if(!is_array($decoded)){
  throw new Exception('Received content contained invalid JSON!');
}
    echo customerAdd($decoded);

?>