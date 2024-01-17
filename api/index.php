<?php
  require_once("DatabaseConnector.php");

  $databaseHandler = new DatabaseConnector();
  $conn = $databaseHandler->getConnection();

  $sql = "select * from board where player = 1;";

  $result  = $conn->query($sql);
  $board = array();

  while ($row = $result ->fetch_assoc()) {
          $board[] = $row;
  }

  echo json_encode($board,true);
  
  // echo "hello world";

  $requestUri = $_SERVER['REQUEST_URI'];
  $str_arr = explode ("/", $requestUri);  

  print_r($str_arr);
?>
