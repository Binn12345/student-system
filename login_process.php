<?php
session_start();
include "db.php"; // your connection

$username = $_POST['username'];
$password = $_POST['password'];
// var_dump('<pre>',$username,$password);
$response = [];

$sql = "SELECT * FROM users WHERE username = ? AND status = 1";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();

$result = $stmt->get_result();

if($result->num_rows > 0){

    $user = $result->fetch_assoc();
    if(password_verify($password, $user['password'])){

        // SESSION
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
         $_SESSION['image'] = $user['image'];
        $_SESSION['role'] = $user['role'];

        $response = [
            "status" => "success",
            "role" => $user['role'],
            "full_name" => $user['full_name']
        ];

    } else {
        $response = [
            "status" => "error",
            "message" => "Invalid password"
        ];
    }

} else {
    $response = [
        "status" => "error",
        "message" => "User not found or inactive"
    ];
}

echo json_encode($response);