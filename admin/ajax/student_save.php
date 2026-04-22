<?php
include '../../db.php';
include '../../view_func.php';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
header('Content-Type: application/json');

try {

    $first = $_POST['first_name'];
    $last  = $_POST['last_name'];
    $middle = $_POST['middle_name'];
    $birthdate = $_POST['birthdate'];

    // 🔍 CHECK DUPLICATE NAME + BIRTHDATE
    $check = $conn->prepare("SELECT id FROM students 
        WHERE first_name=? AND last_name=? AND birthdate=? LIMIT 1");

    $check->bind_param("sss", $first, $last, $birthdate);
    $check->execute();
    $res = $check->get_result();

    if ($res->num_rows > 0) {
        throw new Exception("Student already exists!");
    }

    $student_no = generateStudentNo($conn);

    // =====================
    // USER INSERT
    // =====================
    $yourPassIsLastName = strtoupper($last);
    $password = password_hash($yourPassIsLastName, PASSWORD_DEFAULT);
    $fullname = $last . ', ' . $first . ' ' . $middle;
    $d = 1;
    $d2 = $d + 1;

    $stmt1 = $conn->prepare("INSERT INTO users 
(username, `password`, full_name, `role`, `status`)
VALUES (?, ?, ?, ?, ?)");

    $stmt1->bind_param(
        "sssss",
        $student_no,
        $password,
        $fullname,
        $d2,
        $d
    );

    $stmt1->execute();


    // =====================
    // STUDENT INSERT
    // =====================
    $stmt2 = $conn->prepare("INSERT INTO students 
(student_no, first_name, last_name, middle_name, gender, birthdate, course, year_level, `status`)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $stmt2->bind_param(
        "sssssssii",
        $student_no,
        $first,
        $last,
        $middle,
        $_POST['gender'],
        $birthdate,
        $_POST['course'],
        $_POST['year_level'],
        $d
    );

    $stmt2->execute();

    echo json_encode([
        "status" => "success",
        "message" => "Student added successfully"
    ]);
} catch (Exception $e) {

    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
