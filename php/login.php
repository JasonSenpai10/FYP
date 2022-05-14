<?php 
   
   header('Content-type: application/json');
   header('Access-Control-Allow-Origin: *');

    $db = mysqli_connect('localhost','root', '', 'fyp');
	if (!$db) {
		echo "Database connection failed";  }

    
	$username = $_POST['username'];
	$password = $_POST['password'];

    $sql = "SELECT * FROM login WHERE username = '".$username."' AND password = '".$password."'";

    $result = mysqli_query($db,$sql);
    $count = mysqli_num_rows($result);

    if ($count == 1) {
      echo json_encode($username);


    }else{
      echo json_encode("Error");
    }

    

?>