<?php 
$db = mysqli_connect('localhost','root', '', 'fyp');

    if (!$db) {
        echo "Database connection failed";  }

    $username = $_POST['username'];
    $password = $_POST['password'];

 $sql = "INSERT INTO register(username,password)VALUES ('".$username."','".$password."')";
     $query = mysqli_query($db,$sql);

    if ($query){
     echo json_encode("Success");

     }
     else echo json_encode("error");



?>