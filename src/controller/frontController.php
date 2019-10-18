<?php
require_once(__DIR__ . '/../model/articles.php');

$var = getArticles();

require_once(__DIR__ . '/../view/header.php');

require_once(__DIR__ . '/../view/footer.php');
