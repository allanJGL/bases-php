<?php

require_once __DIR__ . '/../../config/config.php';

function connect()
{
    try {
        return new PDO(
            sprintf('mysql:host=%s;dbname=%s',
                DATABASE_CONFIG['host'],
                DATABASE_CONFIG['database']),
                DATABASE_CONFIG['user'],
                DATABASE_CONFIG['password']
        );
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        die();
    }
}

function getArticles()
{
    $db = connect();

    $query = $db->prepare('SELECT * FROM posts');
    $query->execute();

    return $query->fetchAll();
}

function getArticleContent($idArticle) {

    $db = connect();

    $query = $db->prepare('SELECT * FROM posts WHERE id=' . $idArticle);
    $query->execute();

    return $query->fetchAll();

}

function getArticleCategory($idArticle) {

    $db = connect();

    $query = $db->prepare('SELECT name FROM categories LEFT JOIN posts ON categories.id=posts.idCategory WHERE posts.id=' . $idArticle);
    $query->execute();

    return $query->fetchAll();

}

function deleteArticleById($idArticle) {

        $db = connect();
        echo $idArticle;
        $query = $db->prepare("DELETE FROM posts WHERE id=" . $idArticle);
        $query->execute();
}

function savePost($title, $content, $category, $idUser, $imgPath) {

    $db = connect();

    $query = $db->prepare("INSERT INTO posts (title, content, idCategory, idUser, imagePath) 
        VALUES ('". urlencode($title) . "', '". urlencode($content) . "', " . urlencode($category) . ", " . $idUser . ", '" . $imgPath . "')");
    $query->execute();
}

function editPost($idArticle, $title, $content, $category, $idUser, $imgPath) {

    $db = connect();

    $query = $db->prepare("UPDATE posts SET title = '" . $title . "', content = '" . $content . "', idCategory = " . $category . ", imagePath = '" . $imgPath . "' WHERE id = " . $idArticle);
    $query->execute();
}


?>