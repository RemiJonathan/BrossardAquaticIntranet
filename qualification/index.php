<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();
if (isset($_SESSION['user_id'])) {
    $content = '';
    include(PREAMBLE . "db_operations/connection.php");
    $user_id = $_SESSION['user_id'];

    if (check_user_permissions($user_id, 2)) {
        $get_users_with_qualifications = $db->query("SELECT * FROM user ORDER BY user_lname ASC;");

        $content .= "<h2>Gestion de qualifications</h2><form method='post'><div class=\"row gtr-uniform\"><div class=\"col-12\"><select name='selected_user'>";

        while ($user = $get_users_with_qualifications->fetch_array()) {
            $user_name = $user['user_lname'] . ', ' . $user['user_fname'];
            $user_id = $user['user_id'];

            if (isset($_POST['selected_user'])) {
                $_POST['selected_user'] == $user_id ? $content .= "<option value='$user_id' selected='selected'>$user_name - $user_id</option>" : $content .= "<option value='$user_id'>$user_name - $user_id</option>";
            }else $content .= "<option value='$user_id'>$user_name - $user_id</option>";

        }

        $content .= "</select></div><div class=\"col-12\"><ul class=\"actions\"><li><input value='Modifier' type='submit'></li></ul></div></div></form>";

    } else {
        $content = '<h3>Vous n\'avez pas les permissions requises pour acc&egrave;der a cette page.</h3>';
    }

    block_print_main($content);
} else {
    block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
    session_destroy();
}
block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "	</body>";
echo "</html>";