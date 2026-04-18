<?php require_once "../view_func.php"; ?>

<?php
session_start();
// var_dump($conn);
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

<?= AppHeadPage(true); ?>

<body>

    <?php require_once('../global-header.php'); ?>

    <!-- ======= Sidebar ======= -->
    <?php require_once('../global-sidebar.php'); ?>
    <!-- End Sidebar-->

    <main id="main" class="main">
        <div class="modal fade" id="modalUser">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5>Add User</h5>
                    </div>

                    <div class="modal-body">

                        <input type="text" id="username" class="form-control mb-2" placeholder="Username">
                        <input type="text" id="fullname" class="form-control mb-2" placeholder="Full Name">
                        <input type="password" id="password" class="form-control mb-2" placeholder="Password">
                        <?= showUserRole() ?>
                        <!-- <select id="role" class="form-control">
                            <option value="1">Admin</option>
                            <option value="2">Registrar</option>
                            <option value="3">Cashier</option>
                        </select> -->

                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-primary" id="saveUser">Save</button>
                    </div>

                </div>
            </div>
        </div>
        <div class="pagetitle">
            <h1>User Management</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Pages</li>
                    <li class="breadcrumb-item active">UM</li>
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

                                <button class="btn btn-primary btn-sm" id="btnAddUser">
                                    + Add User
                                </button>
                            </div>

                            <hr>

                            <!-- USER TABLE -->
                            <div class="table-responsive">
                                <table class="table table-striped" id="tblUsers">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Username</th>
                                            <th>Name</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <!-- AJAX LOAD HERE -->
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </section>

    </main><!-- End #main -->

    <?= AppFooterPage(true); ?>
    <script>
        $(document).ready(function() {

            loadUsers();

            function loadUsers() {
                $.ajax({
                    url: "ajax/user_list.php",
                    method: "POST",
                    success: function(data) {
                        $("#tblUsers tbody").html(data);
                    }
                });
            }



            $("#btnAddUser").click(function() {
                $("#modalUser").modal("show");
            });

            $("#saveUser").click(function() {

                $.ajax({
                    url: "ajax/user_save.php",
                    method: "POST",
                    data: {
                        username: $("#username").val(),
                        fullname: $("#fullname").val(),
                        password: $("#password").val(),
                        role: $("#role").val()
                    },
                    success: function(response) {

                        Swal.fire({
                            icon: 'success',
                            title: 'Saved!',
                            text: 'User added successfully'
                        });

                        $("#modalUser").modal("hide");
                        loadUsers();

                    }
                });

            });


            $('.select2').select2({
                width: '100%',
                placeholder: "Select Role",
                allowClear: true
            });
        });
    </script>

</body>

</html>