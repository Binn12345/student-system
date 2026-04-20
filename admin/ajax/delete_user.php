<?php
include '../../db.php';

try {

    $id = $_POST['id'];

    // check if user has student record
    $check = mysqli_query($conn, "
        SELECT 1 FROM students WHERE user_id = '$id'
    ");

    if (mysqli_num_rows($check) > 0) {
        echo "has_students";
        exit;
    }

    $sql = "DELETE FROM users WHERE id = '$id'";
    $result = mysqli_query($conn, $sql);

    if (!$result) {
        throw new Exception(mysqli_error($conn));
    }

    echo "success";

} catch (Exception $e) {
    echo "error: " . $e->getMessage();
}
?>