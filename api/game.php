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

    initGame();

?>