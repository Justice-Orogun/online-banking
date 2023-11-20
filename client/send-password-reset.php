<?php 

$email = $_POST["email"]; 

$token = bin2hex(random_bytes(16)); 

$token_hash = hash("sha256", $token);


$expiry = date("Y-m-d  H:i:s", time() + 60 * 30);

$mysqli = require __DIR__ . "/config/database.php";

$sql = "UPDATE users 
        SET reset_token_hash = ?, 
             reset_token_expires_at = ? 
         WHERE email = ?"; 


$stmt = $mysqli->prepare($sql); 

$stmt->bind_param("sss", $token_hash, $expiry, $email); 

$stmt->execute(); 



if ($mysqli->affected_rows){ 

        $mail = require __DIR__ . "/mailer.php"; 

        $mail->setFrom("wesleyrobertson108@gmail.com"); 
        $mail->addAddress($email); 
        $mail->Subject = "Password Reset"; 
        $mail->Body = <<<END

            Hello amd Welcome to the website. 
        Kindly click <a href="http://localhost/landing/reset-password.php?token=$token">Here</a>

        END; 

        try{ 
            $mail->send();

        }catch (Exception $e){ 
            echo "Your message could not be sent. Mailer error: {$mail->ErrorInfo}"; 
        }
    
}
    echo "Message sent successfully. Please, check your inbox";





?>