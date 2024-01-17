<?php

class DatabaseConnector {
    private $conn;

    public function __construct() {
        $host = "";
        $user = "it185334";
        $pass = "";
        $dbname = "naval_battle";
        $this->conn = new mysqli($host, $user, $pass,$dbname,null,'/home/student/it/2018/it185334/mysql/run/mysql.sock');

        if ($this->conn->connect_error) {
            die("Error " . $this->conn->connect_error);
        }
    }

    public function getConnection() {
        return $this->conn;
    }
}



?>