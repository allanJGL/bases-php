<?php

require_once(__DIR__ . '/../model/users.php');

function login() {
    if ( !isset($_POST['inputUsername'], $_POST['inputPassword']) ) {
        require_once(__DIR__ . '/../view/login.php');
    } else {
        $hashpw = password_hash(getPassword($_POST['inputUsername'])[0], PASSWORD_DEFAULT);
        if (password_verify($_POST['inputPassword'], $hashpw)) {
            $_SESSION['loged'] = 1;
            header('Location: /bases-php');
        } else {
            require_once(__DIR__ . '/../view/login.php');
            echo "wrong password or username.";
        }
    }
}