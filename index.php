<?php

require_once 'vendor/autoload.php';
require_once 'conf/config.php';

use League\Plates\Engine;
use Util\Authenticator;
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
        page_refresh();
    }
}
\Model\UserRepository::checkUser($user, $template);

