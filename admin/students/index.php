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

    .form-control:focus {
        border-color: #4e73df;
        box-shadow: 0 0 0 0.15rem rgba(78, 115, 223, .25);
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


    <div class="modal fade" id="studentModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content shadow-lg border-0 rounded-3">

                <!-- HEADER -->
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">
                        <i class="bi bi-person-plus me-2"></i> Add Student
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <!-- BODY -->
                <div class="modal-body">

                    <!-- PERSONAL INFO -->
                    <h6 class="text-primary mb-3">
                        <i class="bi bi-person me-1"></i> Personal Information
                    </h6>

                    <div class="row">
                        <div class="col-md-4">
                            <label class="form-label">First Name</label>
                            <input type="text" id="first_name" class="form-control mb-3" placeholder="Enter first name">
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Last Name</label>
                            <input type="text" id="last_name" class="form-control mb-3" placeholder="Enter last name">
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Middle Name</label>
                            <input type="text" id="middle_name" class="form-control mb-3" placeholder="Optional">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label class="form-label">Gender</label>
                            <select id="gender" class="form-control mb-3">
                                <option value="">Select Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Birthdate</label>
                            <input type="date" id="birthdate" class="form-control mb-3">
                        </div>
                    </div>

                    <hr>

                    <!-- ACADEMIC INFO -->
                    <h6 class="text-success mb-3">
                        <i class="bi bi-mortarboard me-1"></i> Academic Information
                    </h6>

                    <div class="row">
                        <div class="col-md-6">
                            <label class="form-label">Course</label>
                            <input type="text" id="course" class="form-control mb-3" placeholder="e.g. BSIT">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Year Level</label>
                            <input type="number" id="year_level" class="form-control mb-3" placeholder="1 - 4">
                        </div>
                    </div>

                </div>

                <!-- FOOTER -->
                <div class="modal-footer d-flex justify-content-between">
                    <button class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        Cancel
                    </button>

                    <button class="btn btn-primary px-4" id="saveStudent">
                        <i class="bi bi-save me-1"></i> Save Student
                    </button>
                </div>

            </div>
        </div>
    </div>
    <main id="main" class="main">



        <!-- <div class="pagetitle">
            <h1>Student Management</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Pages</li>
                    <li class="breadcrumb-item active">SM</li>
                </ol>
            </nav>
        </div> -->
        <!-- End Page Title -->

        <section class="section" style="margin-top: 1.2em !important;">
            <div class="card">
                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="card-title">Student Management</h5>

                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#studentModal">
                            + Add Student
                        </button>
                    </div>

                    <div class="mb-3">
                        <input type="text" id="searchStudent" class="form-control" placeholder="Search student...">
                    </div>

                    <div class="table-responsive">
                        <table class="table " id="tblUsers">
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

                        <div id="paginationArea"></div>
                    </div>

                </div>
            </div>
        </section>

    </main><!-- End #main -->
    <?= AppFooterPage(true, true); ?>

    <script>
        $(document).ready(function() {
            // loadStudents();



            let currentPage = 1;

            loadStudents();

            function loadStudents(page = 1) {
                currentPage = page;

                $.ajax({
                    url: "../ajax/student_list.php",
                    method: "POST",
                    data: {
                        page: page,
                        limit: 10,
                        search: $("#searchStudent").val()
                    },
                    dataType: "json",
                    success: function(res) {
                        $("#studentTable").html(res.table);
                        $("#paginationArea").html(res.pagination);
                    }
                });
            }

            // 🔍 SEARCH (live typing)
            $("#searchStudent").on("keyup", function() {
                loadStudents(1);
            });

            // 📄 PAGINATION CLICK
            $(document).on("click", ".page-btn", function(e) {
                e.preventDefault();
                let page = $(this).data("page");
                loadStudents(page);
            });



            $("#saveStudent").click(function() {


                if ($("#first_name").val() === '' || $("#last_name").val() === '') {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Required Fields',
                        text: 'First name and last name are required'
                    });
                    return;
                }
                $.ajax({
                    url: "../ajax/student_save.php",
                    method: "POST",
                    data: {
                        first_name: $("#first_name").val(),
                        last_name: $("#last_name").val(),
                        middle_name: $("#middle_name").val(),
                        gender: $("#gender").val(),
                        birthdate: $("#birthdate").val(),
                        course: $("#course").val(),
                        year_level: $("#year_level").val()
                    },
                    dataType: "json",

                    success: function(res) {

                        if (res.status === "success") {

                            Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: res.message
                            });




                            $("#first_name").val('')
                            $("#birthdate").val('');
                            $("#last_name").val('');

                            $("#studentModal").modal("hide");
                            loadStudents();

                        } else {

                            Swal.fire({
                                icon: 'error',
                                title: 'Duplicate!',
                                text: res.message
                            });

                        }
                    }
                });

            });

            $("#first_name, #last_name, #middle_name").on("input", function() {
                this.value = this.value.toUpperCase();
            });
        });
    </script>


</body>

</html>