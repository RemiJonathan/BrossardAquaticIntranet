<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("users", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();

echo "<section class=\"wrapper style2\" id=\"main\"><div class=\"inner\">";
if (isset($_SESSION['user_id'])) {
    if (check_user_permissions($_SESSION['user_id'], 4)) {

        echo "<div class='col-12'><a href='create.php'><input type='button' value='nouvel usag&eacute;'></a><br /><br />";

        if (isset($_GET['success'])) echo "<div class=\"alert alert-success\" role=\"alert\">
  R&eacute;ussi!
</div>";

        echo "<table style='table-layout: auto; width: 100%;'>";


        $recent_user_sql = "SELECT * FROM user ORDER BY user_id";
        $users = $db->query($recent_user_sql);

        if ($users->num_rows > 0 ){
        echo "<tr><th>NIE</th><th>Nom</th><th>Courriel</th><th></th></tr>";

        while ($user = $users->fetch_array()){
            $id = $user['user_id'];
            $name = $user['user_lname'].', '.$user['user_fname'];
            $email = $user['email'];

            echo "<tr><td>$id</td><td style=\"word-wrap: break-word\">$name</td><td style=\"word-wrap: break-word\">$email</td><td><a href='edit.php?user_id=$id'><i class=\"far fa-edit\"></i></a></td></tr>";
        }

        echo "</table>";
        }else{
            echo "<p>Aucun user n'est publi&eacute;.</p>";
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