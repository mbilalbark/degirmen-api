<?php
header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Headers Origin, X-Requested-With, Content-Type, Accept");
include_once '../model/dbOperation.php';

if(strcasecmp($_SERVER['REQUEST_METHOD'], 'POST') != 0){
  throw new Exception('Request method must be POST!');
}

$contentType = isset($_SERVER["CONTENT_TYPE"]) ? trim($_SERVER["CONTENT_TYPE"]) : '';

if(strcasecmp($contentType, 'application/json') != 0){
  throw new Exception('Content type must be: application/json');
}

$content = file_get_contents("php://input");

$decoded = json_decode($content, true);

if(!is_array($decoded)){
  throw new Exception('Received content contained invalid JSON!');
}
    echo login($decoded['adSoy'], $decoded['sifre']);

?>