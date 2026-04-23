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
                        <h5 class="card-title">Semester Setup</h5>

                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#semModal">
                            + Add Semester
                        </button>
                    </div>

                    <!-- SEARCH -->
                    <div class="mb-3">
                        <input type="text" id="searchSem" class="form-control" placeholder="Search semester...">
                    </div>

                    <!-- TABLE -->
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <!-- <th>ID</th> -->
                                    <th>Semester</th>
                                    <th>School Year</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody id="semTable"></tbody>
                        </table>
                    </div>

                    <!-- <div class="mt-3 d-flex justify-content-end" id="paginationArea"></div> -->
                     <div id="paginationArea"></div>

                </div>
            </div>
        </section>

        <!-- ================= ADD MODAL ================= -->
        <div class="modal fade" id="semModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Add Semester</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">

                        <select id="sy_id" class="form-control mb-2">
                            <option value="">Select School Year</option>
                            <?php
                            $sy = mysqli_query($conn, "SELECT * FROM tblSchoolYear ORDER BY id DESC");
                            while ($row = mysqli_fetch_assoc($sy)) {
                                echo "<option value='{$row['id']}'>{$row['sy_start']} - {$row['sy_end']}</option>";
                            }
                            ?>
                        </select>

                        <input type="text" id="sem_name" class="form-control" placeholder="e.g. 1st Semester">

                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button class="btn btn-primary" onclick="saveSem()">Save</button>
                    </div>

                </div>
            </div>
        </div>

        <!-- CONFIRM MODAL -->
        <div class="modal fade" id="confirmModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Confirmation</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">
                        <p id="confirmMessage"></p>
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
        let actionType = "";
        let actionId = 0;
        let currentPage = 1;

        $(document).ready(function() {
            loadSem();

            $("#searchSem").on("keyup", function() {
                currentPage = 1;
                loadSem();
            });
        });

        /* LOAD */
        function loadSem() {

            $.ajax({
                url: "action.php",
                type: "POST",
                data: {
                    fetch: 1,
                    search: $("#searchSem").val(),
                    page: currentPage
                },
                success: function(res) {
                    let data = JSON.parse(res);
                    $("#semTable").html(data.table);
                    $("#paginationArea").html(data.pagination);
                }
            });
        }

        /* SAVE */
        function saveSem() {
            $.ajax({
                url: "action.php",
                type: "POST",
                data: {
                    save: 1,
                    sy_id: $("#sy_id").val(),
                    sem_name: $("#sem_name").val()
                },
                success: function() {
                    $("#semModal").modal('hide');
                    loadSem();
                }
            });
        }

        /* CONFIRM */
        function openConfirm(type, id) {
            actionType = type;
            actionId = id;

            $("#confirmMessage").text(
                type === "delete" ?
                "Delete this semester?" :
                "Set this semester as ACTIVE?"
            );

            new bootstrap.Modal(document.getElementById('confirmModal')).show();
        }

        /* CONFIRM ACTION */
        $("#confirmBtn").click(function() {

            if (actionType === "delete") {
                deleteSem(actionId);
            }

            if (actionType === "activate") {
                activateSem(actionId);
            }

            bootstrap.Modal.getInstance(document.getElementById('confirmModal')).hide();
        });

        /* ACTIONS */
        function deleteSem(id) {
            $.post("action.php", {
                delete: id
            }, loadSem);
        }

        function activateSem(id) {
            $.post("action.php", {
                activate: id
            }, loadSem);
        }

        /* CHANGE PAGE */
        function goPage(page){
            currentPage = page;
            loadSem();
        }
    </script>


</body>

</html>