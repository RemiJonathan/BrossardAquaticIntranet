<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Articles", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();

echo "<section class=\"wrapper style2\" id=\"main\"><div class=\"inner\">";
if (isset($_SESSION['user_id'])) {
    if (check_user_permissions($_SESSION['user_id'], 4) || check_user_permissions($_SESSION['user_id'], 3) || check_user_permissions($_SESSION['user_id'],2)) {

        echo "<div class='col-12'><a href='create.php'><input type='button' value='nouvel article'></a><br /><br />";

        if (isset($_GET['success'])) echo "<div class=\"alert alert-success\" role=\"alert\">
  R&eacute;ussi!
</div>";

        echo "<table style='table-layout: fixed; width: 100%;'>";


        $recent_article_sql = "SELECT * FROM article ORDER BY article_id DESC LIMIT 10 ";
        $articles = $db->query($recent_article_sql);

        if ($articles->num_rows > 0 ){
        echo "<tr><th>Date</th><th>Titre</th><th>Contenu</th><th></th></tr>";

        while ($article = $articles->fetch_array()){
            $id = $article['article_id'];
            $date = $article['article_date'];
            $title = $article['article_title'];
            $content = substr($article['article_content'],0,40).'&hellip;';
            echo "<tr><td>$date</td><td style=\"word-wrap: break-word\">$title</td><td style=\"word-wrap: break-word\">$content</td><td><a href='edit.php?article_id=$id'><i class=\"far fa-edit\"></i></a>&nbsp;<a href='delete.php?article_id=$id'><i class=\"far fa-trash-alt\"></i></a></td></tr>";
        }

        echo "</table>";
        }else{
            echo "<p>Aucun article n'est publi&eacute;.</p>";
        }
        echo "</div>";


    } else {
        $content = '<h3>Vous n\'avez pas les permissions requises pour acc&egrave;der a cette page.</h3>';
        block_print_main($content);
    }
    block_print_nav("");

} else {
    block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
    session_destroy();
}
echo "</div></section>";
block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "	</body>";
echo "</html>";