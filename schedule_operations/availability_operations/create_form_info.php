<?php
define("PREAMBLE", "../../");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");

include(PREAMBLE . "assets/php/code_blocks.php");
$content = "";

$content .= $_GET['sch_id'] . '<br>';
$content .= $_GET['title'] . '<br>';
$content .= $_GET['deadline'] . '<br>';
$content .= $_GET['gen_info'] . '<br><br>';
$content .= $_GET['meet_info'] . '<br><br>';
$content .= $_GET['guidelines'] . '<br><br>';
var_dump($_GET['day']);
var_dump($_GET['start_time']);
var_dump($_GET['end_time']);
var_dump($_GET['block_cat']);


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Template", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", "../");

session_start();

if (isset($_SESSION['user_id'])) {
    block_print_nav("");
    //TODO VALIDATE USER ACCESS
    block_print_main($content);
} else {
    block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
    session_destroy();
}
//put code in content


block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "	</body>";
echo "</html>";


?>