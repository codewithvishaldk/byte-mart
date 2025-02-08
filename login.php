<?php
// Start session only if not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

include_once 'includes/config.php';
// Include all functions
require_once 'functions/functions.php';

// Fetch website settings
$sql5 = "SELECT * FROM settings;";
$result5 = $conn->query($sql5);
$row5 = $result5->fetch_assoc();

$_SESSION['web-name'] = $row5['website_name'];
$_SESSION['web-img'] = $row5['website_logo'];
$_SESSION['web-footer'] = $row5['website_footer'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <title>Login(USER)</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { display: flex; flex-direction: column; height: 100vh; justify-content: center; align-items: center; }
        form { border: 1px solid red; width: 400px; padding: 25px; border-radius: 10px; }
        .logo-box { padding: 10px; display: flex; justify-content: center; flex-direction: column; align-items: center; }
    </style>
</head>
<body>

<?php if (!isset($_SESSION['id'])) { ?>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
        <div class="logo-box">
            <img src="admin/upload/<?php echo $_SESSION['web-img']; ?>" alt="logo" width="200px">
        </div>
        <div class="mb-3">
            <input id="inputEmail" name="email" type="email" class="form-control" placeholder="Email">
        </div>
        <div class="mb-3">
            <input id="inputPassword" name="pwd" type="password" class="form-control" placeholder="Password">
        </div>
        <div class="mb-3 form-check">
            <input class="form-check-input" type="checkbox" id="gridCheck1">
            <label class="form-check-label" for="gridCheck1">Remember Me</label>
        </div>
        <div class="d-flex justify-content-between">
            <a href="./signup.php" class="btn btn-primary">Sign up</a>
            <button type="submit" class="btn btn-primary" name="login">Sign in</button>
        </div>
    </form>
<?php } ?>

<?php
if (isset($_POST['login'])) {
    $email = isset($_POST['email']) ? mysqli_real_escape_string($conn, $_POST['email']) : '';
    $password = isset($_POST['pwd']) ? mysqli_real_escape_string($conn, $_POST['pwd']) : '';

    if (empty($email)) {
        echo "<h4 id='error_login'>Enter email</h4>";
    }
    if (empty($password)) {
        echo "<h4 id='error_login'>Enter password</h4>";
    }

    if (!empty($email) && !empty($password)) {
        $sql = "SELECT * FROM customer WHERE customer_email='{$email}'";
        $result = $conn->query($sql);

        if ($result->num_rows == 1) {
            $row = $result->fetch_assoc();
            if ($password == $row['customer_pwd']) {
                $_SESSION['id'] = $row['customer_id'];
                $_SESSION['customer_role'] = $row['customer_role'];

                // Redirect to profile page
                header("location:profile.php?id={$_SESSION['id']}");
                exit();
            } else {
                echo "<h4 id='error_login'>Incorrect password</h4>";
            }
        } else {
            echo "<h4 id='error_login'>User not found. Please sign up first.</h4>";
        }
    }
}
?>

</body>
</html>
