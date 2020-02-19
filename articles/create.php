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
    if (check_user_permissions($_SESSION['user_id'], 3) || check_user_permissions($_SESSION['user_id'],2)) {

        echo "<div class='col-12'>";

        echo "<table style='table-layout: fixed; width: 100%;'>";




                echo "
<h2>publier un article</h2>
                <form method='post' action='update.php'>
                <input name='title' type='text' placeholder='titre'  required>
                <textarea name='content' placeholder='contenu' required></textarea>
                <input type='submit' value='publier'>
                </form>";


            echo "</table>";

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