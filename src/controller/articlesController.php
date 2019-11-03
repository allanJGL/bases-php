<?php
require_once(__DIR__ . '/../model/articles.php');
require_once(__DIR__ . '/../model/comments.php');
require_once(__DIR__ . '/../model/users.php');
require_once(__DIR__ . '/commentsController.php');

function writeArticle() {

    if (!isset($_POST['content']) && !isset($_POST['title']) && !isset($_POST['category']) && isset($_SESSION['loged']) && !isset($_POST['image'])) {
        require_once(__DIR__ . '/../view/articleForm.php');
    } else {

        $uploaddir = __DIR__ . '/../../img/';
        $uploadfile = $uploaddir . basename($_FILES['image']['name']);

        if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadfile)) {
            savePost($_POST['title'], $_POST['content'], $_POST['category'], getUserId($_SESSION['name'])[0], "img%5C" . urlencode($_FILES['image']['name']));
            header('Location: /bases-php/');
        } else {
            echo 'veuillez remplir tous les champs';
        }
    }
}

function editArticle($idArticle) {

    if (!isset($_POST['content']) && !isset($_POST['title']) && !isset($_POST['category']) && isset($_SESSION['loged']) && !isset($_POST['image'])) {
        require_once(__DIR__ . '/../view/articleForm.php');
    } else {

        $uploaddir = __DIR__ . '/../../img/';
        $uploadfile = $uploaddir . basename($_FILES['image']['name']);

        if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadfile)) {
            editPost($idArticle, $_POST['title'], $_POST['content'], $_POST['category'], getUserId($_SESSION['name'])[0], "img%5C" . urlencode($_FILES['image']['name']));
            header('Location: /bases-php/');
        } else {
            echo 'veuillez remplir tous les champs';
        }
    }
}

function deleteArticle($idArticle) {
    deleteCommentsFromArticle($idArticle);
    deleteArticleById($idArticle);
    header('Location: /bases-php/');
}

function displayListArticles() {
    $articles = getArticles();

    echo "<ul class=\"list-unstyled\">";

    foreach ($articles as $key => $value) {
            echo "<div class=\"card mb-3\">                    
                    <div class=\"card-body\">
                        <h5 class=\"card-title\">" . urldecode($value['title']) . "</h5>
                        <p class=\"card-text\">Catégorie : " . getArticleCategory($value['id'])[0]['name'] . "</p>        
                        <p class=\"card-text\"><small class=\"text-muted\">&#201;crit par : " . getUsername(urldecode($value['idUser']))[0] . "</small></p>
                        <form method=\'post\' action='deleteArticle=" . $value['id'] . "'>
                            <input type=\"submit\" name=\"submit\" value=\"Supprimer l'article\" id=\"submit\"/>                            
                        </form>
                        <form method=\'post\' action='editArticle=" . $value['id'] . "'>
                            <input type=\"submit\" name=\"submit\" value=\"Modifier l'article\" id=\"submit\"/>                            
                        </form>
                    </div>
                </div>";

    }
    echo "</ul>";

    echo "<h5>Créé une nouvelle catégorie :</h5>";
    echo "<form method=\"post\" action=\"newCategory\">
            <input type=\"text\" name=\"name\" placeholder=\"catégorie\"><br><br>
            <input type=\"submit\" name=\"submit\" value=\"Envoyer\" id=\"submit\"/><br><br><br>
          </form>";
}

function displayArticleContent($idArticle) {

    $var = getArticleContent($idArticle);
    foreach ($var as $key => $value) {
        echo urldecode($value['content']);
    }
}

?>
