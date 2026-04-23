<?php require_once "../../../view_func.php"; ?>
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

<?= AppHeadPage(true, 'acadSetup'); ?>

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
    <?php require_once('../../../global-header.php'); ?>
    <!-- End Header -->

    <?php require_once('../../../global-sidebar.php'); ?>


    <main id="main" class="main">

        <section class="section" style="margin-top: 1.2em !important;">
            <div class="card">
                <div class="card-body">

                    <!-- HEADER -->
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="card-title">School Year Setup</h5>

                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#syModal">
                            + Add School Year
                        </button>
                    </div>

                    <!-- SEARCH -->
                    <div class="mb-3">
                        <input type="text" id="searchSY" class="form-control" placeholder="Search school year...">
                    </div>

                    <!-- TABLE -->
                    <div class="table-responsive">
                        <table class="table" id="tblSY">
                            <thead>
                                <tr>
                                    <!-- <th>ID</th> -->
                                    <th>School Year</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody id="syTable"></tbody>
                        </table>
                    </div>
                    <!-- <div class="mt-3 d-flex justify-content-end" id="paginationArea"></div> -->
                    <div id="paginationArea"></div>

                </div>
            </div>
        </section>

        <!-- MODAL -->
        <div class="modal fade" id="syModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Add School Year</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">
                        <input type="text" id="sy_start" class="form-control mb-2" placeholder="Start Year (e.g. 2025)">
                        <input type="text" id="sy_end" class="form-control" placeholder="End Year (e.g. 2026)">
                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button class="btn btn-primary" onclick="saveSY()">Save</button>
                    </div>

                </div>
            </div>
        </div>

        <!-- ================= CONFIRM MODAL ================= -->
        <div class="modal fade" id="confirmModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Confirmation</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">
                        <p id="confirmMessage">Are you sure?</p>
                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button class="btn btn-danger" id="confirmBtn">Confirm</button>
                    </div>

                </div>
            </div>
        </div>

    </main>
    <!-- End #main -->
    <?= AppFooterPage(true, 'acadSetup'); ?>

    <script>
        let currentPage = 1;
        let actionType = "";
        let actionId = 0;

        $(document).ready(function() {
            loadSY();

            /* LIVE SEARCH */
            $("#searchSY").on("keyup", function() {
                currentPage = 1;
                loadSY();
            });


        });

        /* LOAD TABLE */
        // function loadSY() {
        //     $.ajax({
        //         url: "action.php",
        //         type: "POST",
        //         data: {
        //             fetch: 1
        //         },
        //         success: function(res) {
        //             $("#syTable").html(res);
        //         }
        //     });
        // }

        function loadSY() {

            let search = $("#searchSY").val();

            $.ajax({
                url: "action.php",
                type: "POST",
                data: {
                    fetch: 1,
                    search: search,
                    page: currentPage
                },
                success: function(res) {
                    let data = JSON.parse(res);

                    $("#syTable").html(data.table);
                    $("#paginationArea").html(data.pagination);
                }
            });
        }

        /* SAVE */
        function saveSY() {
            $.ajax({
                url: "action.php",
                type: "POST",
                data: {
                    save: 1,
                    sy_start: $("#sy_start").val(),
                    sy_end: $("#sy_end").val()
                },
                success: function() {
                    $("#syModal").modal('hide');
                    $("#sy_start").val('');
                    $("#sy_end").val('');
                    loadSY();
                }
            });
        }

        /* OPEN CONFIRM MODAL */
        function openConfirm(type, id) {
            actionType = type;
            actionId = id;

            if (type === "delete") {
                $("#confirmMessage").text("Are you sure you want to DELETE this School Year?");
            }

            if (type === "activate") {
                $("#confirmMessage").text("Set this School Year as ACTIVE?");
            }

            $("#confirmModal").modal("show");
        }

        /* CONFIRM ACTION */
        $("#confirmBtn").click(function() {

            if (actionType === "delete") {
                deleteSY(actionId);
            }

            if (actionType === "activate") {
                activateSY(actionId);
            }

            $("#confirmModal").modal("hide");
        });

        /* DELETE */
        function deleteSY(id) {
            $.ajax({
                url: "action.php",
                type: "POST",
                data: {
                    delete: id
                },
                success: function() {
                    loadSY();
                }
            });
        }

        /* ACTIVATE */
        function activateSY(id) {
            $.ajax({
                url: "action.php",
                type: "POST",
                data: {
                    activate: id
                },
                success: function() {
                    loadSY();
                }
            });
        }

        /* CHANGE PAGE */
        function goPage(page) {
            currentPage = page;
            loadSY();
        }
    </script>


</body>

</html>