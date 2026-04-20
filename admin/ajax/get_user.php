<?php
// var_dump('<pre>',$_POST);
include '../../db.php';

$id = $_POST['id'];

$sql = "SELECT * FROM users WHERE id = '$id'";
$result = mysqli_query($conn, $sql);

$row = mysqli_fetch_assoc($result);

// convert image if exists (IMPORTANT)
if (!empty($row['image'])) {
    $row['image'] = base64_encode($row['image']);
}

header('Content-Type: application/json');

echo json_encode($row);
?>