<?php
include '../../db.php';
include '../../view_func.php';

$limit = isset($_POST['limit']) ? (int)$_POST['limit'] : 10;
$page  = isset($_POST['page']) ? (int)$_POST['page'] : 1;
$search = isset($_POST['search']) ? $_POST['search'] : '';

$offset = ($page - 1) * $limit;

// SEARCH
$where = "";
if(!empty($search)){
    $search = mysqli_real_escape_string($conn, $search);
    $where = "WHERE student_no LIKE '%$search%' 
              OR first_name LIKE '%$search%' 
              OR last_name LIKE '%$search%' 
              OR course LIKE '%$search%'";
}

// DATA
$sql = "SELECT * FROM students $where ORDER BY student_no desc LIMIT $limit OFFSET $offset";
$res = mysqli_query($conn, $sql);

// COUNT
$count_sql = "SELECT COUNT(*) as total FROM students $where";
$count_res = mysqli_query($conn, $count_sql);
$total = mysqli_fetch_assoc($count_res)['total'];

// TABLE
$output = "";
while($row = mysqli_fetch_assoc($res)){

    $name = $row['last_name'].", ".$row['first_name'];
    $stats = getStatusDesc($row['status']);
    $status = $row['status'];
    $yrs = getYearLevelDesc($row['year_level']);
    $map = [
        '1' => ['text' => 'Active', 'class' => 'bg-success'],
        '2' => ['text' => 'Inactive', 'class' => 'bg-secondary'],
        '3' => ['text' => 'Graduated', 'class' => 'bg-primary'],
        '4' => ['text' => 'Dropped', 'class' => 'bg-danger'],
    ];

    if(!isset($map[$status])){
        return "<span class='badge bg-dark'>Unknown</span>";
    }
    $output .= "
    <tr>
        <td>{$row['student_no']}</td>
        <td>{$name}</td>
        <td>{$row['course']}</td>
        <td>{$yrs}</td>
        <td><span class='badge {$map[$status]['class']} px-3 py-2'>{$stats}</span></td>
        <td>
            <a href='../../view.profile.php?d=sm&uid={$row['student_no']}' 
               class='btn btn-info btn-sm'>View</a>
        </td>
    </tr>";
}

// RANGE
$start = $offset + 1;
$end = min($offset + $limit, $total);

// PAGINATION
$totalPages = ceil($total / $limit);

$pagination = "<div class='d-flex justify-content-between align-items-center mt-2'>";
$pagination .= "<small class='text-muted'>Showing $start to $end of $total entries</small>";
$pagination .= "<ul class='pagination mb-0'>";

// PREV
if($page > 1){
    $prev = $page - 1;
    $pagination .= "<li class='page-item'>
        <a href='#' class='page-link page-btn' data-page='$prev'>«</a>
    </li>";
}

// NUMBERS
for($i=1; $i <= $totalPages; $i++){
    $active = ($i == $page) ? 'active' : '';
    $pagination .= "<li class='page-item $active'>
        <a href='#' class='page-link page-btn' data-page='$i'>$i</a>
    </li>";
}

// NEXT
if($page < $totalPages){
    $next = $page + 1;
    $pagination .= "<li class='page-item'>
        <a href='#' class='page-link page-btn' data-page='$next'>»</a>
    </li>";
}

$pagination .= "</ul></div>";

// RETURN
echo json_encode([
    "table" => $output,
    "pagination" => $pagination
]);