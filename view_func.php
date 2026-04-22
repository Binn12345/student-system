<?php
require_once "db.php";


function getRoles($rid)
{
  global $conn;

  if (empty($rid)) return '';

  $stmt = $conn->prepare("SELECT role_name FROM roles WHERE id=?");
  $stmt->bind_param("i", $rid);
  $stmt->execute();

  $result = $stmt->get_result();

  if ($row = $result->fetch_assoc()) {
    return $row['role_name'];
  }

  return '';
}
function showUserRole($selected = '')
{
  global $conn;

  $output = '<select id="role" name="role" class="form-control select2">';

  $output .= "<option value=''>-- Select Role --</option>";

  $sql = "SELECT * FROM roles ORDER BY role_name ASC";
  $result = mysqli_query($conn, $sql);

  while ($row = mysqli_fetch_assoc($result)) {
    $isSelected = ($selected == $row['id']) ? 'selected' : '';
    $output .= "<option value='{$row['id']}' {$isSelected}>{$row['role_name']}</option>";
  }

  $output .= '</select>';

  return $output;
}

function AppHeadPage($isFolder = false, $dito = false)
{
  // var_dump($isFolder, $dito);
  $assets = "assets";
  if ($isFolder) $assets = ($dito) ? "../../assets" : "../assets";
  return "<head>
        <meta charset='utf-8'>
        <meta content='width=device-width, initial-scale=1.0' name='viewport'>

        <title>Student Management System | </title>
<meta name='description' content='Access the Student Management System to manage student records, enrollment, grades, attendance, and academic information efficiently.'>
<meta name='keywords' content='Student Management System, SMS, student portal, school management, enrollment system, grades tracking, attendance system, education software'>
<meta name='author' content='Your Organization Name'>
<meta name='viewport' content='width=device-width, initial-scale=1.0'>

        <!-- Favicons -->
        <link href='$assets/img/favicon.png' rel='icon'>
        <link href='$assets/img/apple-touch-icon.png' rel='apple-touch-icon'>

        <!-- Google Fonts -->
        <link href='https://fonts.gstatic.com' rel='preconnect'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i' rel='stylesheet'>

        <!-- Vendor CSS Files -->
        <link href='$assets/vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'>
        <link href='$assets/vendor/bootstrap-icons/bootstrap-icons.css' rel='stylesheet'>
        <link href='$assets/vendor/boxicons/css/boxicons.min.css' rel='stylesheet'>
        <link href='$assets/vendor/quill/quill.snow.css' rel='stylesheet'>
        <link href='$assets/vendor/quill/quill.bubble.css' rel='stylesheet'>
        <link href='$assets/vendor/remixicon/remixicon.css' rel='stylesheet'>
        <link href='$assets/vendor/simple-datatables/style.css' rel='stylesheet'>

        <!-- Template Main CSS File -->
        <link href='$assets/css/style.css' rel='stylesheet'>

        <!-- =======================================================
        * Template Name: NiceAdmin
        * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
        * Updated: Apr 20 2024 with Bootstrap v5.3.3
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
        </head>
        <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
         <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
        <style>
       
        .login-box {
            width: 350px;
            margin: 100px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px #ccc;
        }
       
        button {
            width: 100%;
            padding: 10px;
            background: #006A4E;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .nav-href {
          color: #4154f1 !important;
        }
    </style>
        ";
}


function AppLoginPage()
{


  return "
            <section class='section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4'>
        <div class='container'>
          <div class='row justify-content-center'>
            <div class='col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center'>

              <!-- <div class='d-flex justify-content-center py-4'>
                <a href='index.html' class='logo d-flex align-items-center w-auto'>
                  <img src='assets/img/logo.png' alt=''>
                  <span class='d-none d-lg-block'>NiceAdmin</span>
                </a>
              </div> -->
              <!-- End Logo -->

              <div class='card mb-3'>

                <div class='card-body'>

                  <div class='pt-4 pb-2'>
                    <h5 class='card-title text-center pb-0 fs-4'>Login to Your Account</h5>
                    <p class='text-center small'>Enter your username & password to login</p>
                  </div>

                  <div class='row g-3 needs-validation' novalidate>

                    <div class='col-12'>
                      <label for='yourUsername' class='form-label'>Username</label>
                      <div class='input-group has-validation'>
                        <span class='input-group-text' id='inputGroupPrepend'>@</span>
                        <input type='text' name='username' class='form-control' id='yourUsername' required>
                        <div class='invalid-feedback'>Please enter your username.</div>
                      </div>
                    </div>

                    <div class='col-12'>
                      <label for='yourPassword' class='form-label'>Password</label>
                      <input type='password' name='password' class='form-control' id='yourPassword' required>
                      <div class='invalid-feedback'>Please enter your password!</div>
                    </div>

                    <div class='col-12'>
                      <div class='form-check'>
                        <input class='form-check-input' type='checkbox' name='remember' value='true' id='rememberMe'>
                        <label class='form-check-label' for='rememberMe'>Remember me</label>
                      </div>
                    </div>
                     <div class='col-12'>

                      <button id='btnLogin' class='btn btn-primary w-100' type='submit'>Login</button>
                      
                    </div>
                    <div class='col-12'>
                      <p class='small mb-0'>Don't have account? <a href='pages-register.html'>Create an account</a></p>
                    </div>
                  </form>

        
                 

                </div>
              </div>

              <div class='credits'>
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                <!-- Designed by <a href='https://bootstrapmade.com/'>BootstrapMade</a> -->
              </div>

            </div>
          </div>
        </div>

      </section>
        ";
}


function AppFooterPage($isFolder = false, $dito = false)
{
  // var_dump($isFolder);die;
  $assets = "assets";
  if ($isFolder) $assets = ($dito) ? "../../assets" : "../assets";
  return "<a href='#' class='back-to-top d-flex align-items-center justify-content-center'><i class='bi bi-arrow-up-short'></i></a>

    <!-- Vendor JS Files -->
    <script src='$assets/vendor/apexcharts/apexcharts.min.js'></script>
    <script src='$assets/vendor/bootstrap/js/bootstrap.bundle.min.js'></script>
    <script src='$assets/vendor/chart.js/chart.umd.js'></script>
    <script src='$assets/vendor/echarts/echarts.min.js'></script>
    <script src='$assets/vendor/quill/quill.js'></script>
    <script src='$assets/vendor/simple-datatables/simple-datatables.js'></script>
    <script src='$assets/vendor/tinymce/tinymce.min.js'></script>
    <script src='$assets/vendor/php-email-form/validate.js'></script>


    <!-- Template Main JS File -->
    <script src='$assets/js/main.js'></script>";
}


function generateStudentNo($conn)
{
  $date = date('Ymd'); // 20260422

  $sql = "SELECT COUNT(*) as total FROM students WHERE student_no LIKE '$date%'";
  $res = mysqli_query($conn, $sql);
  $row = mysqli_fetch_assoc($res);

  $next = str_pad($row['total'] + 1, 3, '0', STR_PAD_LEFT);

  return $date . $next;
}

function getYearLevelDesc($y) {

  $yeards = array('1'=>'First Year','2'=>'Second Year','3' => 'Third Year','4' => 'Fourth Year','5' => 'Fifth Year');
  return $yeards[$y];
}

function getStatusDesc($s)
{
  global $conn;
  $res = mysqli_query($conn, "SELECT description FROM tblStudStats WHERE id='{$s}' LIMIT 1");
  $row = mysqli_fetch_assoc($res);

  return $row['description'];
}
