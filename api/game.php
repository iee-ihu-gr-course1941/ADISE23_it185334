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


    $method = $_SERVER['REQUEST_METHOD'];

    switch ($method) {                   
    case 'GET':
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