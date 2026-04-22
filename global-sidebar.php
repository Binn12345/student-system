<?php
// var_dump('<pre>',$_POST,$_GET,$_SESSION,$_SERVER);die;

$file = trim($_SERVER['PHP_SELF'], "\" ");
$pageLoad =  basename($file);

$stdSelf = $connect = "";
if ($pageLoad === "view.profile.php" && $_SESSION["role"] === "1") {
   $connect = "admin/";
}


$file2 = $_SERVER['PHP_SELF'];
$parts2 = explode('/', trim($file2, '/'));
$pageLoad2 = implode('/', array_slice($parts2, -2));

if ($pageLoad2 === "students/index.php") {
    $connect = "../";
    $stdSelf = "students/";
}


// var_dump('<pre>',$_POST,$_GET,$_SESSION,$_SERVER,$pageLoad);die;
?>

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="<?=$connect?>dashboard.php">
                <i class="bi bi-grid"></i>
                <span>Dashboard</span>
            </a>
        </li><!-- End Dashboard Nav -->



        <li class="nav-heading">Pages</li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="<?=$connect?>users.php">
                <i class="bi bi-person"></i>
                <span>User Management</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="<?=$connect?>students/">
                <i class="bi bi-person"></i>
                <span>Student Management</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Academic Setup</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Subjects & Curriculum</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Faculty</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Enrollment</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Fees & Payments</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Reports</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Announcements</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Audit Logs</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Backup & Restore</span>
            </a>
        </li><!-- End Profile Page Nav -->



        <li class="nav-item">
            <a class="nav-link collapsed" href="pages-blank.html">
                <i class="bi bi-file-earmark"></i>
                <span>Blank</span>
            </a>
        </li><!-- End Blank Page Nav -->

    </ul>

</aside><!-- End Sidebar-->