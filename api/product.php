<?php 
include_once '../model/dbOperation.php';
header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Headers Origin, X-Requested-With, Content-Type, Accept");
$content = file_get_contents("php://input");
$decoded = json_decode($content, true);
if(!is_array($decoded)){
  throw new Exception('Received content contained invalid JSON!');
}
if(!empty($decoded['productAdd']))
  echo productAdd($decoded['productAdd']);
else if(!empty($decoded['productList']))
  echo productList();
elseif(!empty($decoded['productDelete']))
  echo productDelete($decoded['productDelete']['Id']);


?>