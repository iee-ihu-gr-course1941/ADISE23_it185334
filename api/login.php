<?php

header("Content-Type: application/json");   
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

require_once("DatabaseConnector.php");

$postData = file_get_contents("php://input");
$jsonData = json_decode($postData, true);

$databaseHandler = new DatabaseConnector();
$conn = $databaseHandler->getConnection();

$username = $jsonData['username'];

$sql = "select player_num as id from players where username = '$username' ;";

$result  = $conn->query($sql);
$board = array();

while ($row = $result ->fetch_assoc()) {
        $board[] = $row;
}

if(count($board) > 0)
    echo json_encode(["message" => "success login", "id" => $board[0]['id']],true);
else
    echo json_encode(["message" => "wrong username"],true);

?>