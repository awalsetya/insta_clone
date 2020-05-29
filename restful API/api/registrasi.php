<?php

include "../config/connect.php";

$response = array();
$email = $_POST['email'];
$username =$_POST['username'];
$password = md5($_POST['password']);
$name = $_POST['name'];

$insert = "INSERT INTO users VALUE(NULL,'$email','$username','$name',NOW(),'$password','1','1','default.png')";
    if (mysqli_query($con, $insert)) {
        $response['value'] = 1;
        $response['message'] = "Successs";
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Failed";
        echo json_encode($response);
    }
?>