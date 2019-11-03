<?php

require_once(__DIR__ . '/../model/users.php');

function login() {
    if ( !isset($_POST['inputUsername'], $_POST['inputPassword']) ) {
        require_once(__DIR__ . '/../view/login.php');
    } else {
        $hashpw = getPassword($_POST['inputUsername'])[0];
        if (password_verify($_POST['inputPassword'], $hashpw)) {
            $_SESSION['loged'] = 1;
            $_SESSION['name'] = $_POST['inputUsername'];
            header('Location: /bases-php');
        } else {
            require_once(__DIR__ . '/../view/login.php');
            echo "wrong password or username.";
        }
    }
}

function signUp() {
    if ( !isset($_POST['inputUsername'], $_POST['inputPassword']) && !isset($_POST['confirmPassword']) ) {
        require_once(__DIR__ . '/../view/signup.php');
    } else {
        if ($_POST['inputPassword'] === $_POST['confirmPassword']) {
            newUser($_POST['inputUsername'], password_hash($_POST['inputPassword'], PASSWORD_DEFAULT));
            $_SESSION['loged'] = 1;
            $_SESSION['name'] = $_POST['inputUsername'];
            header('Location: /bases-php');
        } else {
            require_once(__DIR__ . '/../view/signup.php');
            echo "passwords don't check.";
        }
    }
}