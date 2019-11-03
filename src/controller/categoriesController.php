<?php

require_once(__DIR__ . '/../model/categories.php');


function createCategory() {

    if (!isset($_POST['name'])) {
        header('Location: /bases-php/admin');
    } else {
        saveCategory($_POST['name']);
        header('Location: /bases-php/admin');
    }
}

function displayCategoryList() {
    $categoryList = getCategories();
    echo "<select name=\"category\">";
    foreach ($categoryList as $key => $value) {
        echo "<option value=\"" . $value['id'] . "\">" . $value['name'] . "</option>";
    }
    echo "</select>";
}

?>