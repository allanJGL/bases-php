<?php
require_once(__DIR__ . '/../model/comments.php');

function writeComment($idArticle) {

    require_once(__DIR__ . '/../view/commentBox.php');

    if (isset($_POST['comment']) && isset($_SESSION['loged'])) {
        saveComment($_POST['comment'], $idArticle);
    } elseif (!isset($_SESSION['loged'])) {
        echo "vous n'êtes pas connecté et ne pouvez pas commenter.";
    }
}

function deleteComment($idComment) {
    deleteCommentById($idComment);
    header('Location: /bases-php/');
}

function deleteCommentsFromArticle($idArticle) {
    $comments = getCommentsByArticle($idArticle);
    if (sizeof($comments) > 0) {
        foreach ($comments as $key => $value) {
            deleteCommentById($value['id']);
        }
    }
}

function displayComments($idArticle) {

    $comments = getCommentsByArticle($idArticle);

    echo " <ul class=\"media-list\">";
    foreach ($comments as $key => $value) {
        echo"    <li class=\"media\">
                    <div class=\"media-body\">
                    <strong class=\"text-success\">Commentaire n°" . $value['id'] . "</strong>
                        <p>
                            " . urldecode($value['content']) . "
                        </p>";

        if (isset($_SESSION['loged'])) {
            echo "<form method=\'post\' action='deleteComment=" . $value['id'] . "'>
                    <input type=\"submit\" name=\"submit\" value=\"Supprimer\" id=\"submit\"/>
                  </form>";
        }

        echo"            </div>
                 </li>";
    }
    echo "            </ul>
                </div>
            </div>
        </div>
    </div>
</div>";
}


