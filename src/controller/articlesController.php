<?php
require_once(__DIR__ . '/../model/articles.php');
require_once(__DIR__ . '/../model/comments.php');

function displayArticleContent($idArticle) {

    $var = getArticleContent($idArticle);


    foreach ($var as $key => $value) {
        echo urldecode($value['content']);

        if (isset($_SESSION['loged'])) {
            echo "<form method=\'post\' action='deleteArticle=" . $value['id'] . "'>
                    <input type=\"submit\" name=\"submit\" value=\"Supprimer l'article\" id=\"submit\"/>
                  </form> <br>";
        }
    }

}

function deleteArticle($idArticle) {
    deleteArticleById($idArticle);
    header('Location: /bases-php/');
}

function writeArticle() {

    if (!isset($_POST['content']) && !isset($_POST['title']) && !isset($_POST['category']) && isset($_SESSION['loged'])) {
        require_once(__DIR__ . '/../view/createArticle.php');
    } else {
        savePost($_POST['title'], $_POST['content'], $_POST['category']);
        header('Location: /bases-php/');
    }
}

?>
