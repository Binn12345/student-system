<?php
include '../../db.php';

$username = $_POST['username'];
$fullname = $_POST['fullname'];
$password = password_hash($_POST['password'], PASSWORD_DEFAULT);
$role = $_POST['role'];


// var_dump('<pre>',$_POST);die;
$sql = "INSERT INTO users (username, full_name, password, role, status)
        VALUES ('$username', '$fullname', '$password', '$role', '1')";

mysqli_query($conn, $sql);

echo "success";
?>