<?php 
include_once '../model/dbOperation.php';
header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Headers Origin, X-Requested-With, Content-Type, Accept");
$content = file_get_contents("php://input");
$decoded = json_decode($content, true);
if(!is_array($decoded)){
  throw new Exception('Received content contained invalid JSON!');
}
if(!empty($decoded['customerAdd']))
  echo customerAdd($decoded['customerAdd']);
else if(!empty($decoded['customerList']))
  echo customerList();

  error_reporting(E_ALL);
ini_set("display_errors", 1);
?>