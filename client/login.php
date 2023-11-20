<?php  include '../includes/header.php';?>


<?php 

$is_invalid = false;



if($_SERVER["REQUEST_METHOD"] === "POST"){ 
    $mysqli = require __DIR__ . "/config/database.php"; 

    $sql = sprintf("SELECT * FROM users
            WHERE email = '%s'", 
            $mysqli->real_escape_string($_POST["email"])); 

            $result = $mysqli->query($sql);

        $user = $result->fetch_assoc();


        if($user) { 

            if(password_verify($_POST["password"], $user["password_hash"])) { 
             
                session_start();

                session_regenerate_id();

                $_SESSION["user_id"] = $user["id"];
                header("Location: index.php"); 
                exit;
            }
           
        }

        $is_invalid = true; 
}



?>




                    <h2>Login Here</h2>
                    <?php if($is_invalid) : ?>
                        <em>Your Login is invalid </em>
                        <?php endif; ?>

                <form  class="form" method="post">
                    <input type="email" name="email" id="email"  placeholder="Enter your email" value="<?= htmlspecialchars($_POST["email"] ?? "")?>"> <br>
                    <input type="password"  id="password" name="password" placeholder="Enter your password" >
                    
    
                    <button class="login-btn">Login</button>
    
                     <p class="login"> Don't have an account? <br>
                     <a href="signup.html"> Register </a>here</a>
                    </p>
                    <p>
                        <a href="forgot-password.php">Forgotten password?</a>
                    </p>

                <p class="socials"> Login with:</p>

                <div class="icons">
                    <a href="https://facebook.com"><ion-icon name="logo-facebook"></ion-icon>  </a>
                    <a href="https://instagram.com"> <ion-icon name="logo-instagram"> </ion-icon>  </a>
                    <a href="https://twitter.com"> <ion-icon name="logo-twitter"> </ion-icon>  </a>
                    <a href="https://tiktok.com"> <ion-icon name="logo-tiktok"> </ion-icon>  </a>
                </div>

                </form>



                <?php  include '../includes/footer.php';?>

