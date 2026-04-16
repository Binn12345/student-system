<?php require_once "view_func.php"; ?>
<?php
// var_dump('<pre>',$_GET,$_POST);


//     $password = password_hash("12345", PASSWORD_BCRYPT);
// echo $password;


?>
<!DOCTYPE html>
<html lang="en">

<?= AppHeadPage(); ?>

<body>

    <main>
        <div class="container">

            <?= AppLoginPage(); ?>

        </div>
    </main>

    <?php AppFooterPage(); ?>


    <!-- sample function footer -->
    <script>
$("#btnLogin").click(function(){

    let username = $("#yourUsername").val();
    let password = $("#yourPassword").val();

    if(username === "" || password === ""){
        Swal.fire({
            icon: "warning",
            title: "Required",
            text: "Username and Password are required",
            confirmButtonColor: "#ffc107"
        });
        return;
    }

    $.ajax({
        url: "login_process.php",
        method: "POST",
        data: {
            username: username,
            password: password
        },
        success: function(response){

            let res = JSON.parse(response);

            if(res.status === "success"){

                Swal.fire({
                    icon: "success",
                    title: "Login Successful",
                    text: "Welcome " + res.full_name,
                    confirmButtonColor: "#006A4E"
                }).then(() => {

                    // ROLE BASED REDIRECT
                    if(res.role === "admin"){
                        window.location.href = "admin/dashboard.php";
                    } 
                    else if(res.role === "staff"){
                        window.location.href = "staff/dashboard.php";
                    } 
                    else {
                        window.location.href = "student/portal.php";
                    }

                });

            } else {
                Swal.fire({
                    icon: "error",
                    title: "Login Failed",
                    text: res.message,
                    confirmButtonColor: "#d33"
                });
            }

        }
    });

});
</script>
</body>

</html>