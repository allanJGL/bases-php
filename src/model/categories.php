<?php

require_once __DIR__ . '/../../config/config.php';
require_once(__DIR__ . '/articles.php');

function getCategories() {
    $db = connect();

    $query = $db->prepare('SELECT * FROM categories');
    $query->execute();

    return $query->fetchAll();
}

function saveCategory($category) {
    $db = connect();

    $query = $db->prepare("INSERT INTO categories (name) VALUES ('" . $category . "')");
    $query->execute();

    return $query->fetchAll();
}