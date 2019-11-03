<?php
require_once(__DIR__ . '/../model/articles.php');
require_once(__DIR__ . '/../model/users.php');

function displayArticles($page) {
    $page = $page*10;
    $articles = getArticles();
    $iteration = 0;

    echo "<ul class=\"list-unstyled\">";
    foreach ($articles as $key => $value) {
        $iteration++;
        if (($iteration <= $page) && ($iteration > $page-10) ) {
            echo "<div class=\"card mb-3\">
                    <img class=\"card-img-top\" src=\"" . urldecode($value['imagePath']) . "\" alt=\"Card image cap\">
                    <div class=\"card-body\">
                        <h5 class=\"card-title\">" . urldecode($value['title']) . "</h5>
                        <p class=\"card-text\">Catégorie : " . getArticleCategory($value['id'])[0]['name'] . "</p>
                        <a href=\"articleId=". $value['id'] . "\" class=\"card-link\">Voir la recette</a>                        
                        <p class=\"card-text\"><small class=\"text-muted\">&#201;crit par : " . getUsername(urldecode($value['idUser']))[0] . "</small></p>
                    </div>
                </div>";
        }
    }
    echo "</ul>";
}

function displayPagination() {
    $size = sizeof(getArticles());
    if ($size >= 10) {
        echo "<nav aria-label=\"...\">
                <ul class=\"pagination justify-content-center\">";
        for ($i=1; $i<=intval($size/10)+1; $i++) {
            echo "<li class=\"page-item\"><a class=\"page-link\" href=\"page=$i\">$i</a></li>";
        }
        echo "</ul>
            </nav>";
    }
}
?>