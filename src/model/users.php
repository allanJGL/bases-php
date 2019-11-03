<?php

require_once __DIR__ . '/../../config/config.php';
require_once(__DIR__ . '/articles.php');

function getUsername($idUser)
{
    $db = connect();

    $query = $db->prepare('SELECT username FROM users WHERE id = ' . $idUser);
    $query->execute();

    return $query->fetch();
}

function getPassword($username){

    $db = connect();

    $query = $db->prepare("SELECT password FROM users WHERE username = '" . $username ."'");
    $query->execute();

    return $query->fetch();
}

function saveUser($username, $password) {
    $db = connect();

    $query = $db->prepare("INSERT INTO users (username, password) VALUES ('" . $username . "', '" . $password . "')" );
    $query->execute();

}

function getUserId($username) {

    $db = connect();

    $query = $db->prepare("SELECT id FROM users WHERE username = '" . $username ."'");
    $query->execute();

    return $query->fetch();

}