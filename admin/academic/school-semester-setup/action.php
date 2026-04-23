<?php
include '../../../db.php';

/* FETCH */
/* FETCH */
/* FETCH */
if (isset($_POST['fetch'])) {

    $search = $_POST['search'] ?? '';
    $page = $_POST['page'] ?? 1;
    $limit = 5;
    $start = ($page - 1) * $limit;

    $where = "";
    if ($search != "") {
        $where = "WHERE s.name LIKE '%$search%'";
    }

    /* TOTAL COUNT */
    $countQuery = mysqli_query($conn, "
        SELECT COUNT(*) as total 
        FROM tblSemester s 
        $where
    ");
    $countRow = mysqli_fetch_assoc($countQuery);
    $totalRecords = $countRow['total'];

    $pages = ceil($totalRecords / $limit);

    /* FETCH DATA */
    $sql = mysqli_query($conn, "
        SELECT s.*, sy.sy_start, sy.sy_end
        FROM tblSemester s
        LEFT JOIN tblSchoolYear sy ON sy.id = s.sy_id
        $where
        ORDER BY s.id DESC
        LIMIT $start, $limit
    ");

    $table = "";

    while ($row = mysqli_fetch_assoc($sql)) {

        $status = $row['is_active']
            ? "<span class='badge bg-success'>Active</span>"
            : "<span class='badge bg-secondary'>Inactive</span>";

        $btn = "";

        if (!$row['is_active']) {
            $btn .= "<button class='btn btn-sm btn-success' onclick='openConfirm(\"activate\",{$row['id']})'>Activate</button> ";
        }

        $btn .= "<button class='btn btn-sm btn-danger' onclick='openConfirm(\"delete\",{$row['id']})'>Delete</button>";

        $table .= "
        <tr>
            
            <td>{$row['name']}</td>
            <td>{$row['sy_start']} - {$row['sy_end']}</td>
            <td>{$status}</td>
            <td>{$btn}</td>
        </tr>";
    }

    /* ===== MODERN PAGINATION ===== */
    $pagination = "<div class='d-flex justify-content-between align-items-center'>";

    // LEFT TEXT
    $startRecord = ($totalRecords > 0) ? $start + 1 : 0;
    $endRecord = min($start + $limit, $totalRecords);

    $pagination .= "
        <div class='small text-muted'>
            Showing $startRecord to $endRecord of $totalRecords entries
        </div>
    ";

    // RIGHT BUTTONS
    $pagination .= "<nav><ul class='pagination pagination-sm mb-0'>";

    // PREVIOUS
    if ($page > 1) {
        $prev = $page - 1;
        $pagination .= "
            <li class='page-item'>
                <a class='page-link' href='javascript:void(0)' onclick='goPage($prev)'>&laquo;</a>
            </li>
        ";
    }

    // PAGE NUMBERS (limited range)
    $startPage = max(1, $page - 2);
    $endPage = min($pages, $page + 2);

    for ($i = $startPage; $i <= $endPage; $i++) {
        $active = ($i == $page) ? "active" : "";

        $pagination .= "
            <li class='page-item $active'>
                <a class='page-link' href='javascript:void(0)' onclick='goPage($i)'>$i</a>
            </li>
        ";
    }

    // NEXT
    if ($page < $pages) {
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
if (isset($_POST['save'])) {
    $sy_id = $_POST['sy_id'];
    $name = $_POST['sem_name'];

    mysqli_query($conn, "INSERT INTO tblSemester (name, sy_id) VALUES ('$name','$sy_id')");
}

/* DELETE */
if (isset($_POST['delete'])) {
    mysqli_query($conn, "DELETE FROM tblSemester WHERE id='$_POST[delete]'");
}

/* ACTIVATE */
if (isset($_POST['activate'])) {
    mysqli_query($conn, "UPDATE tblSemester SET is_active=0");
    mysqli_query($conn, "UPDATE tblSemester SET is_active=1 WHERE id='$_POST[activate]'");
}
