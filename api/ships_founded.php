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

function getAllShipsNames()
{
    $databaseHandler = new DatabaseConnector();
    $conn = $databaseHandler->getConnection();

    $sql = "select typeofship from ships_p1;";

    $result  = $conn->query($sql);
    $games = array();

    while ($row = $result ->fetch_assoc()) {
          $games[] = $row;
    }

    $conn->close();

    return $games;
}

function getFoundedShips($player_)
{
    $databaseHandler = new DatabaseConnector();
    $conn = $databaseHandler->getConnection();

    $allShipsName = getAllShipsNames();
    $toReturn = array();

    foreach($allShipsName as $ship)
    {
        $ship_name = $ship['typeofship'];
        $sql = "call checkFounded('$ship_name', $player_);";

        // Execute the stored procedure
        if ($conn->multi_query($sql)) {
            do {
                // Store the result set
                if ($result = $conn->store_result()) {
                    while ($row = $result->fetch_assoc()) {
                        array_push($toReturn, ["ship_name" => $ship_name, "founded" => $row["message"]]);
                    }
                    $result->free(); // Free the result set
                }
            } while ($conn->next_result()); // Move to the next result set
        }
        

    }

    

    return $toReturn;
}

echo json_encode(getFoundedShips($player),true);


?>