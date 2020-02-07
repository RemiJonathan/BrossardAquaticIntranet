<?php
define('PREAMBLE', '../../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");
$sch_id = "";
$user_id = "";
$content = "";
if (isset($_POST['sch_id'])) {
    $sch_id = $_POST['sch_id'];
}
if (isset($_POST['user_id'])) {
    $user_id = $_POST['user_id'];
}
//$testArray = $_POST['isAvail[]'];
var_dump($_POST);
echo $_POST['sch_id'];
echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();

block_print_nav("<li></li>");
block_print_main($content);

block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);

echo "	</body>";
echo "</html>";
