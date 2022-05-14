<?php 

header('Content-type: application/json');
header('Access-Control-Allow-Origin: *');



  $db = mysqli_connect('localhost','root', '', 'fyp');
	if (!$db) {
		echo "Database connection failed";  
  }

  if($_SERVER['REQUEST_METHOD'] == "POST") {  
  	$username = $_POST['username'];
  	$password = $_POST['password'];

	$sql = "SELECT username FROM login WHERE username = '".$username."'";

    //$sql = "SELECT * FROM register WHERE username = '".$username."' AND password = '".$password."'";

    $result = mysqli_query($db, $sql);
    $count = mysqli_num_rows($result);
    
    if ($count >= 1){
    	echo json_encode("Error");
    } else {
    	 $insert = "INSERT INTO login(username,password) VALUES ('".$username."','".$password."')";

    	$query = mysqli_query($db,$insert);

      if($query) {

        echo json_encode("Success");
      } else {
        echo json_encode("Error");
      }
    }
  } else {
    echo json_encode("Error");
  }




 

?>