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
    <!-- ======= Header ======= -->
    <?php require_once('../global-header.php'); ?>

    <!-- ======= Sidebar ======= -->
    <?php require_once('../global-sidebar.php'); ?>
    <!-- End Sidebar-->


    <div class="modal fade" id="basicModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Basic Modal</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="user_id">
                    <input type="text" id="hJob" name="hJob" value="save" hidden>
                    <div class="text-center mb-3">
                        <img id="previewImage" src="../assets/img/logo.png"
                            class="rounded-circle"
                            style="width:120px;height:120px;object-fit:cover;cursor:pointer;">

                        <input type="file" id="userImage" accept="image/*" hidden>
                        <small class="d-block mt-2 text-muted">Click image to upload</small>
                    </div>
                    <input type="text" id="username" class="form-control mb-2" placeholder="Username">
                    <input type="text" id="fullname" class="form-control mb-2" placeholder="Full Name">
                    <input type="password" id="password" class="form-control mb-2" placeholder="Password">
                    <?= showUserRole() ?>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="saveUser">Save changes</button>
                </div>
            </div>
        </div>
    </div>


    <main id="main" class="main">



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

                                <!-- <button class="btn btn-primary btn-sm" id="btnAddUser" >
                                    + Add User
                                </button> -->

                                <button type="button" class="btn btn-primary" id="btnAddUser" data-bs-toggle="modal" data-bs-target="#basicModal">
                                    + Add User
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
                                            <th>#</th>
                                            <th>Image</th>
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
                // $("#modalUser .modal-title").text('Add User');
                $("#basicModal .modal-title").text('Add User');
                $("#username").prop('hidden', false);
            });

            $("#saveUser").click(function() {
                $("#username").prop('hidden', false);
                let formData = new FormData();

                formData.append("username", $("#username").val());
                formData.append("fullname", $("#fullname").val());
                formData.append("password", $("#password").val());
                formData.append("role", $("#role").val());
                formData.append("hJob", $("#role").val());

                // IMAGE FILE
                let file = $("#userImage")[0].files[0];
                if (file) {
                    formData.append("image", file);
                }

                $.ajax({
                    url: "ajax/user_save.php",
                    method: "POST",
                    data: formData,
                    contentType: false, // REQUIRED
                    processData: false, // REQUIRED

                    success: function(response) {

                        if (response === "invalid_file") {
                            Swal.fire({
                                icon: 'error',
                                title: 'Invalid File',
                                text: 'Only JPG/PNG allowed'
                            });
                            return;
                        }

                        Swal.fire({
                            icon: 'success',
                            title: 'Saved!',
                            text: 'User added successfully'
                        });



                        $("#basicModal").modal("hide");

                        // RESET FORM
                        $("#username").val('');
                        $("#fullname").val('');
                        $("#password").val('');
                        $("#role").val('').trigger('change');

                        $("#userImage").val('');
                        $("#previewImage").attr("src", "");

                        loadUsers();
                    }
                });

            });


            $('.btn-close').click(function() {
                // RESET FORM

                $("#username").prop('hidden', false);
                $("#username").val('');
                $("#fullname").val('');
                $("#password").val('');
                $("#role").val('').trigger('change');

                $("#userImage").val('');
                $("#previewImage").attr("src", "")
            })


            $("#previewImage").click(function() {
                $("#userImage").click();
            });

            $("#userImage").change(function(e) {
                const file = e.target.files[0];

                if (file) {
                    const reader = new FileReader();

                    reader.onload = function(e) {
                        $("#previewImage").attr("src", e.target.result);
                    }

                    reader.readAsDataURL(file);
                }
            });


            $(document).on("click", ".btnDelete", function() {

                let id = $(this).data("id");

                Swal.fire({
                    title: "Are you sure?",
                    text: "This user will be permanently deleted!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#d33",
                    cancelButtonColor: "#3085d6",
                    confirmButtonText: "Yes, delete it!"
                }).then((result) => {

                    if (result.isConfirmed) {

                        $.post("ajax/delete_user.php", {
                            id: id
                        }, function(res) {

                            if (res.trim() == "success") {

                                Swal.fire({
                                    title: "Deleted!",
                                    text: "User has been deleted.",
                                    icon: "success",
                                    timer: 1500,
                                    showConfirmButton: false
                                });

                                loadUsers(); // reload table

                            } else {

                                Swal.fire({
                                    title: "Error!",
                                    text: "Failed to delete user.",
                                    icon: "error"
                                });

                            }

                        });

                    }

                });

            });

        });

        $(document).on("click", ".btnEdit", function() {
            $("#basicModal .modal-title").text('Edit User');
            let id = $(this).data("id");
            $("#username").prop('hidden', true);
            $.ajax({
                url: "./ajax/get_user.php",
                type: "POST",
                data: {
                    id: id
                },
                dataType: "json",
                success: function(user) {

                    $("#modalTitle").text("Edit User");

                    $("#user_id").val(user.id);
                    $("#username").val(user.username);
                    $("#fullname").val(user.full_name);
                    $("#role").val(user.role);
                    $("#hJob").val('edit');


                    $("#password").val("");

                    console.log(user);

                    if (user.image) {
                        $("#previewImage").attr("src",
                            "data:image/jpeg;base64," + user.image
                        );
                    }

                    $("#basicModal").modal("show");
                }
            });


            $("#searchUser").on("keyup", function() {
                alert('test');
                let search = $(this).val();

                $.ajax({
                    url: "ajax/user_list.php",
                    type: "POST",
                    data: {
                        search: search
                    },
                    success: function(data) {
                        $("#tblUsers tbody").html(data);
                    }
                });

            });

           

       
});


 $(document).ready(function () {
    $("#searchUser").on("keyup", function () {
        let search = $(this).val();

        $.post("ajax/user_list.php", { search: search }, function (data) {
            $("#tblUsers tbody").html(data);
        });
         function loadUsers() {
                $("#tblUsers tbody").html(`
        <tr><td colspan="6" class="text-center">Loading...</td></tr>
    `);

                $.post("ajax/user_list.php", function(data) {
                    $("#tblUsers tbody").html(data);
                });
            }

        });
    });

    </script>

</body>

</html>