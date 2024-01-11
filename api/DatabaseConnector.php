<?php

class DatabaseConnector {
    private $conn;

    public function __construct() {
        $host = "localhost";
        $user = "root";
        $pass = "";
        $dbname = "naval_battle";
        $this->conn = new mysqli($host, $user, $pass,$dbname);

        if ($this->conn->connect_error) {
            die("Error " . $this->conn->connect_error);
        }
    }

    public function getConnection() {
        return $this->conn;
    }
}



?>
