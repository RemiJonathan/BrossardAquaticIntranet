<?php
define('PREAMBLE', '../');
include (PREAMBLE."assets/php/code_blocks.php");
include (PREAMBLE."db_operations/connection.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil",PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();
if(isset($_SESSION['user_id'])) {

}else{
    block_print_nav("<li><a href='".PREAMBLE."login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>".$connection_form);
    session_destroy();
}
block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "	</body>";
echo "</html>";