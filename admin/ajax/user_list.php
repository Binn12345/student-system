<?php
include '../../db.php';
include '../../view_func.php';

$search = $_POST['search'] ?? '';

$sql = "SELECT * FROM users 
        WHERE username LIKE '%$search%' 
        OR full_name LIKE '%$search%' 
        OR role LIKE '%$search%'";

$result = mysqli_query($conn, $sql);

$output = "";
$cnt = 1;

while ($row = mysqli_fetch_assoc($result)) {

$status = ($row['status'] == '1' || $row['status'] == 'active')
    ? '<span class="badge bg-success px-3 py-2">Active</span>'
    : '<span class="badge bg-danger px-3 py-2">Inactive</span>';

$image = (!empty($row['image']))
    ? "<img src='data:image/jpeg;base64," . base64_encode($row['image']) . "' 
        class='rounded-circle shadow-sm' 
        style='width:40px;height:40px;object-fit:cover;'>"
    : "<img src='../assets/img/logo.png' 
        class='rounded-circle shadow-sm' 
        style='width:40px;height:40px;object-fit:cover;'>";
        
        $ole = getRoles($row['role']);

$output .= "
<tr class='user-row'>
  <td>{$cnt}</td>
  <td>{$image}</td>
  <td><a class='text-primary fw-bold' href='../view.profile.php?d=um&uid={$row['username']}'>{$row['username']}</a></td>
  <td>{$row['full_name']}</td>
  <td><span class='badge bg-secondary px-3 py-2'>{$ole}</span></td>
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