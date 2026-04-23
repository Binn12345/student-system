<?php
include '../../../db.php';

/* FETCH */
/* FETCH */
if(isset($_POST['fetch'])) {

    $search = $_POST['search'] ?? '';
    $page = $_POST['page'] ?? 1;

    $limit = 5;
    $start = ($page - 1) * $limit;

    /* SEARCH CONDITION */
    $where = "";
    if(!empty($search)){
        $where = "WHERE sy_start LIKE '%$search%' 
                  OR sy_end LIKE '%$search%'";
    }

    /* TOTAL RECORDS */
    $countQuery = mysqli_query($conn, "SELECT COUNT(*) as total FROM tblSchoolYear $where");
    $countRow = mysqli_fetch_assoc($countQuery);
    $totalRecords = $countRow['total'];

    $totalPages = ceil($totalRecords / $limit);

    /* DATA QUERY */
    $sql = mysqli_query($conn, "
        SELECT * FROM tblSchoolYear 
        $where 
        ORDER BY id DESC 
        LIMIT $start, $limit
    ");

    $table = "";

    while($row = mysqli_fetch_assoc($sql)) {

        $status = $row['is_active']
            ? "<span class='badge bg-success'>Active</span>"
            : "<span class='badge bg-secondary'>Inactive</span>";

        $action = "";

        if(!$row['is_active']){
            $action .= "<button class='btn btn-sm btn-success' onclick='openConfirm(\"activate\", {$row['id']})'>Set Active</button> ";
        }

        $action .= "<button class='btn btn-sm btn-danger' onclick='openConfirm(\"delete\", {$row['id']})'>Delete</button>";

        $table .= "
        <tr>
            <!-- <td>{$row['id']}</td> -->
            <td>{$row['sy_start']} - {$row['sy_end']}</td>
            <td>{$status}</td>
            <td>{$action}</td>
        </tr>";
    }

    /* ===== PAGINATION UI (LIKE YOUR IMAGE) ===== */
    $pagination = "<div class='d-flex justify-content-between align-items-center'>";

    /* LEFT TEXT (Showing X to Y of Z entries) */
    $startRecord = ($totalRecords > 0) ? $start + 1 : 0;
    $endRecord = min($start + $limit, $totalRecords);

    $pagination .= "<div class='small text-muted'>
        Showing $startRecord to $endRecord of $totalRecords entries
    </div>";

    /* RIGHT PAGINATION BUTTONS */
    $pagination .= "<nav><ul class='pagination pagination-sm mb-0'>";

    // PREVIOUS
    if($page > 1){
        $prev = $page - 1;
        $pagination .= "
            <li class='page-item'>
                <a class='page-link' href='javascript:void(0)' onclick='goPage($prev)'>&laquo;</a>
            </li>
        ";
    }

    // LIMIT PAGE NUMBERS (for clean UI)
    $startPage = max(1, $page - 2);
    $endPage = min($totalPages, $page + 2);

    for($i = $startPage; $i <= $endPage; $i++){
        $active = ($i == $page) ? "active" : "";

        $pagination .= "
            <li class='page-item $active'>
                <a class='page-link' href='javascript:void(0)' onclick='goPage($i)'>$i</a>
            </li>
        ";
    }

    // NEXT
    if($page < $totalPages){
        $next = $page + 1;
        $pagination .= "
            <li class='page-item'>
                <a class='page-link' href='javascript:void(0)' onclick='goPage($next)'>&raquo;</a>
            </li>
        ";
    }

    $pagination .= "</ul></nav>";
    $pagination .= "</div>";

    echo json_encode([
        "table" => $table,
        "pagination" => $pagination
    ]);
    exit;
}
/* SAVE */
if(isset($_POST['save'])) {
    $start = $_POST['sy_start'];
    $end = $_POST['sy_end'];

    mysqli_query($conn, "INSERT INTO tblSchoolYear (sy_start, sy_end) VALUES ('$start', '$end')");
}

/* DELETE */
if(isset($_POST['delete'])) {
    $id = $_POST['delete'];

    mysqli_query($conn, "DELETE FROM tblSchoolYear WHERE id='$id'");
}

/* ACTIVATE */
if(isset($_POST['activate'])) {
    $id = $_POST['activate'];

    mysqli_query($conn, "UPDATE tblSchoolYear SET is_active=0");
    mysqli_query($conn, "UPDATE tblSchoolYear SET is_active=1 WHERE id='$id'");
}
?>