<?php

header("Content-Type: application/json");   
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

require_once("DatabaseConnector.php");

// Parse the request URI
$requestUri = $_SERVER['REQUEST_URI'];
$str_arr = explode("/", $requestUri);  
// print_r($str_arr); 

$player = $str_arr[5];

$databaseHandler = new DatabaseConnector();
$conn = $databaseHandler->getConnection();

$sql = "select * from board where player = $player;";

$result  = $conn->query($sql);
$board = array();

while ($row = $result ->fetch_assoc()) {
        $board[] = $row;
}

echo json_encode($board,true);


?>