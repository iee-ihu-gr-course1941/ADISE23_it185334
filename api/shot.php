<?php

header("Content-Type: application/json");   
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

require_once("DatabaseConnector.php");

// Parse the request URI
$requestUri = $_SERVER['REQUEST_URI'];
$str_arr = explode ("/", $requestUri);  
// print_r($str_arr); 

$player = $str_arr[4];

$method = $_SERVER['REQUEST_METHOD'];

function makeHit($player_, $x, $y)
{
    $databaseHandler = new DatabaseConnector();
    $conn = $databaseHandler->getConnection();

    $sql = "";
    if($player_ == 1)
        $sql = "update board set is_hitted = 'Y' where ( player = 2 ) and (x_data = $x) and (y_data = $y);";
    else
        $sql = "update board set is_hitted = 'Y' where ( player = 1 ) and (x_data = $x) and (y_data = $y);";

    if ($conn->query($sql) === FALSE) {
        throw new Exception("Error on php");
      }
      
    $conn->close();
}

if($method == "POST")
{
    
$postData = file_get_contents("php://input");
$jsonData = json_decode($postData, true);
makeHit($player, $jsonData["x"],$jsonData["y"]);



$databaseHandler = new DatabaseConnector();
$conn = $databaseHandler->getConnection();

$sql = "";
$x = $jsonData['x'];
$y = $jsonData['y'];
if($player == 1)
{
    $sql = "select ship_on_board from board where x_data = $x and y_data = $y and player = 2 ;";
}
else
{
    $sql = "select ship_on_board from board where x_data = $x and y_data = $y and player = 1 ;";
}
   


$result  = $conn->query($sql);
$games = array();

while ($row = $result ->fetch_assoc()) {
      $games[] = $row;
}

echo json_encode($games,true);
}
else
{
    echo "no action on get";
}


?>