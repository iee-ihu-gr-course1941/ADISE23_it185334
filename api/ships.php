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

function getAvailableShips($player_)
{
    $databaseHandler = new DatabaseConnector();
    $conn = $databaseHandler->getConnection();

    $sql;
    if($player_ == 1)
    {
        $sql = "select * from ships_p1 where placed = 0;";
    }
    else if($player_ == 2)
    {
        $sql = "select * from ships_p2 where placed = 0;";
    }
    else
    {
        echo "lathos pektis";
        return;
    }

    $result  = $conn->query($sql);
    $games = array();

    while ($row = $result ->fetch_assoc()) {
          $games[] = $row;
    }

    return $games;
}

function placeShip($player_, $shipName, $x, $y, $orientation)
{
    $databaseHandler = new DatabaseConnector();
    $conn = $databaseHandler->getConnection();


    $sql = "call placeShip('$shipName',$x,$y,'$orientation',$player_);";

    if ($conn->query($sql) === FALSE) {
        throw new Exception("Error on placing the ship");
      }
      
    $conn->close();

    return ["message" => "ship placed"];
}

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {                   
    case 'GET':
        echo json_encode(getAvailableShips($player));
        break;
    case 'POST':
        $postData = file_get_contents("php://input");
        $jsonData = json_decode($postData, true);
        echo json_encode(placeShip($player,$jsonData["shipName"],$jsonData["x"],$jsonData["y"],$jsonData["orientation"]));
        break;

}



?>
