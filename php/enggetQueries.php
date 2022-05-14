<?php 

header('Content-type: application/json');
header('Access-Control-Allow-Origin: *');



  $db = mysqli_connect('localhost','root', '', 'fyp');
	if (!$db) {
		echo "Database connection failed";  
  }

  if($_SERVER['REQUEST_METHOD'] == "GET") {  
  	

	$sql = "SELECT queries,id FROM engquery";

    

    $result = mysqli_query($db, $sql);
    $count = mysqli_num_rows($result);
    
    $queries = [];
    
    if ($count > 0){
    	while($row = mysqli_fetch_array($result)) {
        array_push($queries, $row);
      }

    }
    echo json_encode($queries);
  } else {
    echo json_encode("Error");
  }
