<?php
require_once __DIR__ . '/../../config/config.php';
require_once(__DIR__ . '/articles.php');

function getCommentsByArticle($idArticle)
{
    $db = connect();

    $query = $db->prepare('SELECT * FROM comments WHERE idPost=' . $idArticle);
    $query->execute();

    return $query->fetchAll();
}

function saveComment($comment, $idArticle) {

    $db = connect();

    $query = $db->prepare("INSERT INTO comments (content, idPost) VALUES ('". urlencode($comment) . "', '" . $idArticle . "')");
    $query->execute();

}


function deleteCommentById($idComment) {

    $db = connect();

    $query = $db->prepare("DELETE FROM comments WHERE id=" . $idComment);
    $query->execute();
}
