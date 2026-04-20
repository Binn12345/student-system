<?php
include '../../db.php';

$id = $_POST['id'] ?? '';
$job = $_POST['hJob'];

$username = $_POST['username'];
$fullname = $_POST['fullname'];
$role = $_POST['role'];

$imageData = NULL;
$imageType = NULL;

/* ================= IMAGE PROCESS ================= */
if (isset($_FILES['image']) && $_FILES['image']['tmp_name'] != '') {

    $allowed = ['image/jpeg', 'image/png', 'image/jpg'];
    $fileType = $_FILES['image']['type'];

    if (!in_array($fileType, $allowed)) {
        echo "invalid_file";
        exit;
    }

    if ($fileType == 'image/png') {
        $img = imagecreatefrompng($_FILES['image']['tmp_name']);
    } else {
        $img = imagecreatefromjpeg($_FILES['image']['tmp_name']);
    }

    $newWidth = 200;
    $newHeight = 200;

    $tmp = imagecreatetruecolor($newWidth, $newHeight);
    imagecopyresampled(
        $tmp,
        $img,
        0, 0, 0, 0,
        $newWidth, $newHeight,
        imagesx($img),
        imagesy($img)
    );

    ob_start();
    imagejpeg($tmp, NULL, 25);
    $imageData = addslashes(ob_get_contents());
    ob_end_clean();

    $imageType = "image/jpeg";

    imagedestroy($img);
    imagedestroy($tmp);
}


// var_dump('<pre>',$_POST);die;

// CHECK IF EXIST
$newEntry = false;
$sql = "SELECT 1 FROM users WHERE username='{$_POST['username']}' and role='{$_POST['role']}'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) == 0) $newEntry = true;

// var_dump($newEntry);die;
/* ================= INSERT ================= */
if ($newEntry) {

    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $sql = "INSERT INTO users 
        (username, full_name, password, role, image, status, image_type)
        VALUES 
        ('$username', '$fullname', '$password', '$role', '$imageData', '1', '$imageType')";

    mysqli_query($conn, $sql);

/* ================= UPDATE ================= */
} else  {

    $updates = [];

    // $updates[] = "username='$username'";
    $updates[] = "full_name='$fullname'";
    $updates[] = "role='$role'";

    // PASSWORD (optional)
    if (!empty($_POST['password'])) {
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $updates[] = "password='$password'";
    }

    // IMAGE (optional)
    if ($imageData !== NULL) {
        $updates[] = "image='$imageData'";
        $updates[] = "image_type='$imageType'";
    }

    $sql = "UPDATE users SET " . implode(", ", $updates) . " WHERE username='$username'";


    mysqli_query($conn, $sql);
}

echo "success";
?>