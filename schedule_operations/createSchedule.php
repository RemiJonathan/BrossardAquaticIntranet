<?php
define("PREAMBLE","../");
include (PREAMBLE."db_operations/connection.php");
include ('../db_operations/db_functions.php');
include (PREAMBLE."assets/php/code_blocks.php");



?>


<?php



$content =  "<!DOCTYPE HTML><html>";


if($_POST["title"] == null || $_POST["sch_start_date"] == null || $_POST["sch_end_date"] == null || $_POST["avail_deadline"] == null){
    $content.="Erreur: Un titre doit exister (Exemple: Hiver 2020) et les trois dates doivent exister ";

    $content .= '<br><a href="schedule_creation.php">Retour</a>';
}else{
    insertNewSchedule($db,$_POST["sch_start_date"],$_POST["sch_end_date"],$_POST["avail_deadline"],$_POST["title"]);
    $content.="Horaire g&eacute;n&eacute;r&eacute; avec succ&egrave;s";

    $content .= '<br><a href="schedule_creation.php">Retour</a>';
}

block_print_document_header("Template", PREAMBLE);
$content .=  "<body class=\"is-preload\">";
$content .=  "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
//TODO: put logic to verify cookie and modify this
block_print_nav("<li><a href=\"".PREAMBLE."login.php\">Connexion</a></li>");

//put code in content
block_print_main($content);

block_print_copyright();
$content .=  "    </div>";
block_print_scripts(PREAMBLE);
$content .=  "	</body>";
$content .=  "</html>";
