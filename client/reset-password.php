<?php 

$token = $_GET["token"]; 

$token_hash = hash("sha256", $token);

$mysqli = require __DIR__ . "/database.php"; 

    $sql = "SELECT * FROM users 
            WHERE reset_token_hash  = ?"; 

    
$stmt = $mysqli->prepare($sql); 

$stmt->bind_param("s", $token_hash); 


$stmt->execute(); 

$result = $stmt->get_result(); 

$user = $result->fetch_assoc(); 

if ($user === null){
    die("This token is not found");
}

if (strtotime($user["reset_token_expires_at"]) <= time()) { 
    die("Sorry, your token has expired"); 
}
echo "Your token is still valid and has not expired"; 




?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Your Password</title>
</head>
<body>

        <h1>Reset Password</h1>
        <form action="process-reset-password.php" method="post">
            <input type="hidden" name="token" value="<?=htmlspecialchars($token) ?>">

            <label for="password">New Password</label> <br> 
            <input type="password" id="password" name="password"> <br>

             <label for="password_confirmation">Repeat Password</label> <br> <br>
            <input type="password" id="password_confirmation" name="password_confirmation">
                <br> 
            <button>Send</button>


        </form>
    
</body>
</html>