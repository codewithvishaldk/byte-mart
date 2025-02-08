<?php
session_start();
include "includes/config.php"; // Ensure session variables are set
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    
    <title>ADMIN | Login</title>

    <style>
      * { box-sizing: border-box; margin: 0; padding: 0; }
      body { display: flex; flex-direction: column; height: 100vh; justify-content: center; align-items: center; }
      form { border: 1px solid red; width: 400px; padding: 25px; border-radius: 10px; }
      .logo-box { padding: 10px; display: flex; justify-content: center; flex-direction: column; align-items: center; }
      h4 { text-align: center; margin: 15px; }
    </style>
</head>
<body>

    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
      <div class="logo-box">
        <img
          src="./upload/<?php echo isset($_SESSION['web-img']) ? $_SESSION['web-img'] : 'default-logo.png'; ?>"
          alt="logo"
          width="200px"
        />
      </div>
      <h4>Admin Panel Login</h4>
      <div class="row mb-3">
        <div class="col-sm-12">
          <input id="inputEmail" name="userEmail" type="email" class="form-control" placeholder="Email" required />
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-12">
          <input id="inputPassword" name="password" type="password" class="form-control" placeholder="Password" required />
        </div>
      </div>

      <div style="float: right">
        <button type="submit" name="login" class="btn btn-primary">Sign in</button>
      </div>
    </form>

    <?php 
        if (isset($_POST['login'])) {
            if (empty($_POST['userEmail']) || empty($_POST['password'])) {
                echo '<div class="alert alert-danger">All fields must be entered.</div>';
            } else {
                $email = mysqli_real_escape_string($conn, $_POST['userEmail']);
                $password = mysqli_real_escape_string($conn, $_POST['password']);
            
                $sql = "SELECT customer_id, customer_email, customer_pwd FROM customer WHERE customer_email = '{$email}'";
                $result = mysqli_query($conn, $sql);

                if ($result && mysqli_num_rows($result) > 0) {
                    $row = mysqli_fetch_assoc($result);

                    if ($password === $row['customer_pwd']) {
                        $_SESSION['logged-in'] = true;
                        $_SESSION['admin_id'] = $row['customer_id'];
                        header("Location: ./post.php");
                        exit;
                    } else {
                        echo '<div class="alert alert-danger">Incorrect password.</div>';
                    }
                } else {
                    echo '<div class="alert alert-danger">User not found. Please sign up.</div>';
                }
            }
        }
    ?>

</body>
</html>
