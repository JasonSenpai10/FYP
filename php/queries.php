<?php 

header('Content-type: application/json');
header('Access-Control-Allow-Origin: *');



  $db = mysqli_connect('localhost','root', '', 'fyp');
	if (!$db) {
		echo "Database connection failed";  
  }

  if($_SERVER['REQUEST_METHOD'] == "POST") {  
  	$queries = $_POST['queries'];
  	

   


    	$insert = "INSERT INTO query(queries) VALUES ('".$queries."')";

    	$query = mysqli_query($db,$insert);

      if($query) {

        echo json_encode("Success");
      } else {
        echo json_encode("Error");
      }
   // }
  }
 // else {
 //   echo json_encode("Error");
 // }




 

?>