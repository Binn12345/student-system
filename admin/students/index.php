<?php require_once "../../view_func.php"; ?>
<?php
session_start();

// Prevent cache
// header("Cache-Control: no-cache, no-store, must-revalidate");
// header("Pragma: no-cache");
// header("Expires: 0");

header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
header("Expires: 0");

if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">

<?= AppHeadPage(true, true); ?>

<style>
    #tblUsers {
        border-collapse: separate;
        border-spacing: 0 10px;
    }

    #tblUsers tbody tr {
        background: #fff;
        transition: all 0.2s ease-in-out;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    }

    #tblUsers tbody tr:hover {
        transform: scale(1.01);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
    }

    #tblUsers td {
        padding: 12px;
        vertical-align: middle;
    }
</style>

<body>

    <div class="modal fade" id="logoutModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Confirm Logout</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    Are you sure you want to sign out?
                </div>

                <div class="modal-footer">
                    <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
          Cancel
        </button> -->

                    <a href="../logout.php" class="btn btn-danger">
                        Yes, Logout
                    </a>
                </div>

            </div>
        </div>
    </div>

    <!-- ======= Header ======= -->
    <?php require_once('../../global-header.php'); ?>
    <!-- End Header -->

    <?php require_once('../../global-sidebar.php'); ?>

    <main id="main" class="main">



        <div class="pagetitle">
            <h1>Student Management</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Pages</li>
                    <li class="breadcrumb-item active">SM</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card shadow-sm">
                        <div class="card-body">

                            <div class="d-flex justify-content-between align-items-center">
                                <h5 class="card-title"></h5>

                                <!-- <button class="btn btn-primary btn-sm" id="btnAddUser" >
                                    + Add User
                                </button> -->

                                <button type="button" class="btn btn-primary" id="btnAddUser" data-bs-toggle="modal" data-bs-target="#basicModal">
                                    + Add Student
                                </button>
                            </div>
                            <div class="mb-3">
                                <input type="text" id="searchUser" class="form-control" placeholder="Search user...">
                            </div>

                            <hr>

                            <!-- USER TABLE -->
                            <div class="table-responsive">
                                <table class="table table-striped" id="tblUsers">
                                    <thead>
                                        <tr>
                                            <th>Student No</th>
                                            <th>Name</th>
                                            <th>Course</th>
                                            <th>Year</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="studentTable"></tbody>
                                </table>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </section>

    </main><!-- End #main -->
    <?= AppFooterPage(true, true); ?>

    <script>
        $(document).ready(function() {
            loadStudents();

            function loadStudents() {
                $.post("../ajax/student_list.php", function(data) {
                    $("#studentTable").html(data);
                });
            }

            $("#saveStudent").click(function() {

                $.post("../ajax/student_save.php", {
                    first_name: $("#first_name").val(),
                    last_name: $("#last_name").val(),
                    middle_name: $("#middle_name").val(),
                    gender: $("#gender").val(),
                    birthdate: $("#birthdate").val(),
                    course: $("#course").val(),
                    year_level: $("#year_level").val()
                }, function(res) {

                    Swal.fire("Success", "Student Added", "success");
                    $("#studentModal").modal("hide");
                    loadStudents();
                });

            });

        });
    </script>


</body>

</html>