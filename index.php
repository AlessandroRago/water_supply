<?php

require_once 'vendor/autoload.php';
require_once 'conf/config.php';

use League\Plates\Engine;
use Util\Authenticator;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
function page_refresh(){
    echo "<meta http-equiv='refresh' content='0;url=index.php'>";
    exit;
}
$template = new Engine('templates','tpl');
//Fa partire il processo di autenticazione
$user = Authenticator::getUserByEmail();
if ($user == null){
    echo $template->render('login');
    exit(0);
}




$displayed_name = $user['nome'];
if (isset($_GET['action'])){
    if (($_GET['action']) == 'logout'){
        Authenticator::logout();
        echo $template->render('login');
        exit(0);
    }
}
if (isset($_GET['action'])){
    if (($_GET['action']) == 'survey'){
        \Model\UserRepository::retrieveAnswers($user);
        sendConfirmationEmail($user['email'], $user['nome']);
        page_refresh();
    }
}

function sendConfirmationEmail($toEmail, $toName) {
    $mail = new PHPMailer();
    $mail->isSMTP();
    $mail->SMTPDebug = SMTP::DEBUG_OFF;  // Impostare a DEBUG_OFF per l'uso in produzione
    $mail->Host = 'smtp.gmail.com';
    $mail->Port = 465;
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
    $mail->SMTPAuth = true;
    $mail->Username = 'safehydrations@gmail.com';
    $mail->Password = 'djxp efmb jdpv dacq';  // Sostituire con la password corretta
    $mail->setFrom('safehydrations@gmail.com', 'Pip Pop');
    $mail->addReplyTo('safehydrations@gmail.com', 'Pip Pop');
    $mail->addAddress($toEmail, $toName);
    $mail->Subject = 'Partecipazione sondaggio';
    $mail->Body = 'Grazie per aver partecipato al nostro sondaggio!';
    $mail->send();
}
\Model\UserRepository::checkUser($user, $template);

