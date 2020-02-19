<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");



echo "<!DOCTYPE HTML><html>";
block_print_document_header("Users", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();

echo "<section class=\"wrapper style2\" id=\"main\"><div class=\"inner\">";
if (isset($_SESSION['user_id'])) {
    if (check_user_permissions($_SESSION['user_id'], 4)) {

        echo "<div class='col-12'><a href='index.php'><input type='button' value='Retour'></a><br /><br />";

        echo "<table style='table-layout: fixed; width: 100%;'>";




                echo "
<h2>publier un user</h2>
                <form id=\"form1\" name=\"form1\" method=\"post\" action=\"update.php\">
<label for=\"user_id\">User Id</label><input class='form-control' type=\"text\" name=\"user_id\" id=\"user_id\" value='' required  readonly/>

<label for=\"passphrase\">Passphrase</label><input class='form-control' type=\"password\" name=\"passphrase\" id=\"passphrase\"/>

<label for=\"user_fname\">User Fname</label><input class='form-control' type=\"text\" name=\"user_fname\" id=\"user_fname\" value='' required  />

<label for=\"user_lname\">User Lname</label><input class='form-control' type=\"text\" name=\"user_lname\" id=\"user_lname\" value='' required  />

<label for=\"email\">Email</label><input class='form-control' type=\"email\" name=\"email\" id=\"email\" value=''/>

<label for=\"user_address\">User Address</label><input class='form-control' type=\"text\" name=\"user_address\" id=\"user_address\" value=''  />

<label for=\"role_id\">Role Id</label><input class='form-control' type=\"number\" name=\"role_id\" id=\"role_id\" min='1' max='4' value='' required  />

<label for=\"user_dob\">User Dob</label><input class='form-control' type=\"date\" name=\"user_dob\" id=\"user_dob\" value='' />
<input type='submit' value='Mettre &agrave; jour'>
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