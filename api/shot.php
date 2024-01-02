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



    $my_founded_ships = array();
    if($player_ == 1)
        $my_founded_ships = getFoundedShips(2);
    else
        $my_founded_ships = getFoundedShips(1);
    $founded_count = 0;
    foreach ($my_founded_ships as $x) {
        if($x['founded'] == 'Y')
            $founded_count = $founded_count + 1;
      }

    if($founded_count == 4)
    {
        $databaseHandler = new DatabaseConnector();
        $conn = $databaseHandler->getConnection();

        $sql = "update game_status set status = 'ended', result = $player_; ";

        if ($conn->query($sql) === FALSE) {
            throw new Exception("Error on php");
          }
          
        $conn->close();
    }
    else
    {
        $databaseHandler = new DatabaseConnector();
        $conn = $databaseHandler->getConnection();

        $sql = "";
        if($player_ == 1)
            $sql = "update game_status set p_turn = 2;";
        else
            $sql = "update game_status set p_turn = 1;";

        if ($conn->query($sql) === FALSE) {
            throw new Exception("Error on php");
        }
        
        $conn->close();
        }

}


function getGameTurn()
{
    $databaseHandler = new DatabaseConnector();
    $conn = $databaseHandler->getConnection();

    $sql = "select p_turn from game_status;";

    $result  = $conn->query($sql);
    $games = array();

    while ($row = $result ->fetch_assoc()) {
        $games[] = $row;
    }

    return $games[0]['p_turn'];
}




if($method == "POST")
{

    if(getGameTurn() != $player)
    {
        echo json_encode(["message" => "ain't your turn"], true);
        return;
    }

    $databaseHandler = new DatabaseConnector();
    $conn = $databaseHandler->getConnection();
$postData = file_get_contents("php://input");
$jsonData = json_decode($postData, true);
 #START CONTROLL MAKE HIT
 $sql = "";
 $x = $jsonData['x'];
 $y = $jsonData['y'];
 if($player == 1)
 {
     $sql = "select is_hitted from board where ( player = 2 ) and (x_data = $x) and (y_data = $y);";
 }
 else
 {
     $sql = "select is_hitted from board where ( player = 1 ) and (x_data = $x) and (y_data = $y);";
 }
 


 $result  = $conn->query($sql);
 $games = array();

 while ($row = $result ->fetch_assoc()) {
     $games[] = $row;
 }

 if($games[0]['is_hitted'] == 'Y')
 {
     echo json_encode(["message" => "You already hitted this square"], true);
     return;
 }
 else
 {
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
     
 

 #END CONTROLL MAKE HIT

}
else
{
    echo "no action on get";
}


?>