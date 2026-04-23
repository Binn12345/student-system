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
// var_dump($pageLoad2);die;
if ($pageLoad2 === "students/index.php") {
    $connect = "../";
    $stdSelf = "students/";
} else if ($pageLoad2 === "school-year-setup/index.php") {
    $connect = "../../";
    $stdSelf = "school-year-setup/";
} else if ($pageLoad2 === "school-semester-setup/index.php") {
    $connect = "../../";
    $stdSelf = "school-year-setup/";
}


// var_dump('<pre>',$_POST,$_GET,$_SESSION,$_SERVER,$pageLoad);die;

// var_dump('<pre>',$_POST,$_SESSION);die;
?>







<?php if($_SESSION['role'] == 1) { ?>
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

        <!-- <li class="nav-item">
            <a class="nav-link collapsed" href="<?=$connect?>academic/">
                <i class="bi bi-person"></i>
                <span>Academic Setup</span>
            </a>
        </li> -->
        <!-- End Profile Page Nav -->

        <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-person""></i><span>Academic Setup</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="<?=$connect?>academic/school-year-setup/">
              <i class="bi bi-circle"></i><span>School Year</span>
            </a>
          </li>
          <li>
            <a href="<?=$connect?>academic/school-semester-setup/">
              <i class="bi bi-circle"></i><span>Semester</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Department</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Course</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Year Level</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Section</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Subject</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Curriculum</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Class Assignment</span>
            </a>
          </li>
        </ul>
      </li>
      <!-- End Icons Nav -->

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

</aside>
<!-- End Sidebar-->
<?php } else if ($_SESSION['role'] == 2) { ?>

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="<?=$connect?>dashboard.php">
                <i class="bi bi-grid"></i>
                <span>Announcement</span>
            </a>
        </li><!-- End Dashboard Nav -->



        <li class="nav-heading">Pages</li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="<?=$connect?>users.php">
                <i class="bi bi-person"></i>
                <span>Enrollment</span>
            </a>
        </li><!-- End Profile Page Nav -->


        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Subjects/Class List</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Grades</span>
            </a>
        </li><!-- End Profile Page Nav -->

      

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Attendance</span>
            </a>
        </li><!-- End Profile Page Nav -->

        
  

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Documents</span>
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
                <span>Billing</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>Payments</span>
            </a>
        </li><!-- End Profile Page Nav -->


        

    </ul>

</aside>
<!-- End Sidebar-->

<?php }  ?>




?>