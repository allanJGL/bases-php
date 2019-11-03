<?php
session_start();

$requestedPage = '/';

if (isset($_SERVER['REQUEST_URI'])) {
    $requestedPage = $_SERVER['REQUEST_URI'];
    $requestedPage = explode('?', $requestedPage);
}

if (isset($_SESSION['loged'])) {
    require_once(__DIR__ . '/src/view/headerLogin.php');
} else {
    require_once(__DIR__ . '/src/view/header.php');
}

switch ($requestedPage[0]) {

    case '/bases-php/' :
        include_once(__DIR__ . '/src/controller/frontController.php');
        displayArticles(1);
        displayPagination();
        break;

    case '/bases-php/login' :
        include_once(__DIR__ . '/src/controller/loginController.php');
        login();
        break;

    case '/bases-php/signup' :
        include_once(__DIR__ . '/src/controller/loginController.php');
        signUp();
        break;

    case '/bases-php/logoff' :
        session_destroy();
        header('Location: /bases-php');
        break;

    case '/bases-php/newArticle' :
        include_once(__DIR__ . '/src/controller/articlesController.php');
        writeArticle();
        break;

    case '/bases-php/newCategory' :
        include_once(__DIR__ . '/src/controller/categoriesController.php');
        createCategory();
        break;

    case '/bases-php/admin' :
        include_once(__DIR__ . '/src/controller/articlesController.php');
        include_once(__DIR__ . '/src/controller/categoriesController.php');
        displayListArticles();
        break;

    case (preg_match('/page=.*/', $requestedPage[0]) ? true : false) :
        include_once(__DIR__ . '/src/controller/frontController.php');
        preg_match('/(\d+)/', $requestedPage[0], $m);
        displayArticles($m[0]);
        displayPagination();
        break;

    case (preg_match('/articleId=.*/', $requestedPage[0]) ? true : false) :
        include_once(__DIR__ . '/src/controller/articlesController.php');
        include_once(__DIR__ . '/src/controller/commentsController.php');
        preg_match('/(\d+)/', $requestedPage[0], $m);
        displayArticleContent($m[0]);
        writeComment($m[0]);
        displayComments($m[0]);
        break;

    case (preg_match('/deleteComment=.*/', $requestedPage[0]) ? true : false) :
        include_once(__DIR__ . '/src/controller/commentsController.php');
        preg_match('/(\d+)/', $requestedPage[0], $m);
        deleteComment($m[0]);
        break;

    case (preg_match('/deleteArticle=.*/', $requestedPage[0]) ? true : false) :
        include_once(__DIR__ . '/src/controller/articlesController.php');
        preg_match('/(\d+)/', $requestedPage[0], $m);
        deleteArticle($m[0]);
        break;

    case (preg_match('/editArticle=.*/', $requestedPage[0]) ? true : false) :
        include_once(__DIR__ . '/src/controller/articlesController.php');
        preg_match('/(\d+)/', $requestedPage[0], $m);
        editArticle($m[0]);
        break;
}

require_once(__DIR__ . '/src/view/footer.php');
?>

