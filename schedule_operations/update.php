<?php
define("PREAMBLE", "../");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");
include(PREAMBLE . "assets/php/code_blocks.php");
$sessionsArray = getSessions($db);
$content = "";
if (isset($_GET["sch_id"])) {
    $sch_id = $_GET["sch_id"];
    $title = $_GET["title"];
    $sch_start_date = $_GET["sch_start_date"];
    $sch_end_date = $_GET["sch_end_date"];
    $avail_deadline = $_GET["avail_deadline"];

    updateSession($db, $sch_id, $sch_start_date, $sch_end_date, $avail_deadline, $title);
}
$content .= $title;
$content .= $sch_id;

header("location:schedule_modification.php");


//TODO add option to create new semester and add files to it


$content .= "<!DOCTYPE HTML><html>";
block_print_document_header("Template", PREAMBLE);
$content .= "<body class=\"is-preload\">";
$content .= "<div id=\"page-wrapper\">";
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
$content .= "    </div>";
block_print_scripts("../");
$content .= "	</body>";
$content .= "</html>";


?>