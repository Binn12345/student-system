<?php
include '../../db.php';

$sql = "SELECT * FROM users";
$result = mysqli_query($conn, $sql);

$output = "";

$cnt = 1;
while($row = mysqli_fetch_assoc($result)) {

$status = $row['status'] == 'active'
    ? '<span class="badge bg-success">Active</span>'
    : '<span class="badge bg-danger">Inactive</span>';

$output .= "
<tr>
  <td>{$cnt}</td>
  <td>{$row['username']}</td>
  <td>{$row['full_name']}</td>
  <td>{$row['role']}</td>
  <td>{$status}</td>
  <td>
    <button class='btn btn-warning btn-sm btnEdit' data-id='{$row['id']}'>Edit</button>
    <button class='btn btn-danger btn-sm btnDelete' data-id='{$row['id']}'>Delete</button>
  </td>
</tr>
";

$cnt++;
}

echo $output;
?>