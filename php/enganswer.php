<?php 

header('Content-type: application/json');
header('Access-Control-Allow-Origin: *');

  $db = mysqli_connect('localhost','root', '', 'fyp');
	if (!$db) {
		echo "Database connection failed";  
  }

  if($_SERVER['REQUEST_METHOD'] == "POST") {  
    // var_dump($_POST);
  	$answer = $_POST['answer'];
	   $qid = $_POST['qid'];
  	
    	$insert = "INSERT INTO enganswer(qid,answer) VALUES ('$qid','$answer')";

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