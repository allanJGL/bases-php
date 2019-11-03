<form method="post" action="" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="titre"><br><br>
    <?php
        include_once(__DIR__ . '/../controller/categoriesController.php');
        displayCategoryList();
    ?>
    <textarea name="content" class="form-control" placeholder="Ecrit ici..." rows="3"></textarea>
    <br>
    <input type="file" name="image" /><br><br>
    <input type="submit" name="submit" value="Envoyer" id="submit"/><br><br><br>
</form>
