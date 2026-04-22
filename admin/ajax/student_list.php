<?php
include '../../db.php';
include '../../view_func.php';


$sql = "SELECT * FROM students ORDER BY student_no asc";
$res = mysqli_query($conn, $sql);

while($row = mysqli_fetch_assoc($res)){

$name = $row['last_name'].", ".$row['first_name'];
$stats = getStatusDesc($row['status']);
$yrs = getYearLevelDesc($row['year_level']);

echo "
<tr class='user-row'>
<td>{$row['student_no']}</td>
<td>{$name}</td>
<td>{$row['course']}</td>
<td>{$yrs}</td>
<td>{$stats}</td>
<td>
  <a href='../../view.profile.php?d=sm&uid={$row['student_no']}' class='btn btn-info btn-sm'>View</a>
</td>
</tr>
";
}