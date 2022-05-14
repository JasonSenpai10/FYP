<?php
header("Access-Control-Allow-Origin: *");
include 'DatabaseConfig.php';

$con = mysqli_connect($HostName, $HostUser, $HostPass, $DatabaseName);

if(isset($_POST['booking_id'])){
    $book_id = $_POST['booking_id'];

    $query = "DELETE FROM bookings WHERE booking_id = '$book_id'";
    $result = mysqli_query($con, $query);
    if ($result){
        $data = [
            'success' => true,
            'message' => 'Booking deleted sucessfully'
        ];
        echo json_encode($data);
    }else{
        $data = [
            'success' => false,
            'message' => 'Something went wrong'
        ];
        echo json_encode($data);
    }
}else{
    $data = [
        'success' => false,
        'message' => 'All Fields are Required'
    ];
    echo json_encode($data);
}