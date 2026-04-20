<?php
include '../../db.php';

$id = $_POST['id'];
$username = $_POST['username'];
$fullname = $_POST['fullname'];
$role = $_POST['role'];
$status = $_POST['status'];

$sql = "UPDATE users 
        SET username='$username',
            full_name='$fullname',
            role='$role',
            status='$status'
        WHERE id='$id'";

mysqli_query($conn, $sql);

echo "success";
?>