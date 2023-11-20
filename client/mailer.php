<?php 

use PHPMailer\PHPMailer\PHPMailer;

require '../PHPMailer/src/Exception.php'; 
require '../PHPMailer/src/PHPMailer.php'; 
require '../PHPMailer/src/SMTP.php';

$mail = new PHPMailer(true);


$mail->isSMTP(); 
$mail->SMTPAuth = true; //smtp auth property
//smtp server configuration
$mail->Host = "smtp.gmail.com";
$mail->SMTPSecure = "tls";
$mail->Port = 587; 
$mail->Username = "wesleyrobertson108@gmail.com"; 
$mail->Password = "nrmafhmxynivkabt"; 

$mail->isHTML(true); 

return $mail;

