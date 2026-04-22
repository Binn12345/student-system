<?php
include '../../db.php';
// include '../functions.php';
include '../../view_func.php'; // nandito generateStudentNo()

$student_no = generateStudentNo($conn);

$sql = "INSERT INTO students 
(student_no, first_name, last_name, middle_name, gender, birthdate, course, year_level)
VALUES (
'$student_no',
'{$_POST['first_name']}',
'{$_POST['last_name']}',
'{$_POST['middle_name']}',
'{$_POST['gender']}',
'{$_POST['birthdate']}',
'{$_POST['course']}',
'{$_POST['year_level']}'
)";

mysqli_query($conn, $sql);

echo "success";