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

echo json_encode(getAvailableShips($player));


?>