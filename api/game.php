<?php
    header("Content-Type: application/json");   
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");

    require_once("DatabaseConnector.php");

    function initGame()
    {
        $databaseHandler = new DatabaseConnector();
        $conn = $databaseHandler->getConnection();

        $sql = "call initGame();";

        if ($conn->query($sql) === FALSE) {
            throw new Exception("Error on creating games");
            }
            
        $conn->close();
    }

    function getGameStatus()
    {
        $databaseHandler = new DatabaseConnector();
        $conn = $databaseHandler->getConnection();

        $sql = "select p_turn, status, result as winner from game_status;";

        $result  = $conn->query($sql);
        $board = array();

        while ($row = $result ->fetch_assoc()) {
                $board[] = $row;
        }

        return $board[0];
    }

    $method = $_SERVER['REQUEST_METHOD'];

    switch ($method) {                   
    case 'GET':
        $game_s = getGameStatus();
        echo json_encode($game_s,true);
        // initGame();

        // echo json_encode(["message" => "init success"], true);
        break;
    case 'POST':
        initGame();

        echo json_encode(["message" => "init success"], true);
        break;
        // $postData = file_get_contents("php://input");
        // $jsonData = json_decode($postData, true);
        // echo json_encode(placeShip($player,$jsonData["shipName"],$jsonData["x"],$jsonData["y"],$jsonData["orientation"]));
        break;

}

    

?>