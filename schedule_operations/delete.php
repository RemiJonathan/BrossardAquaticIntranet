<?php
define("PREAMBLE","../");
include (PREAMBLE."db_operations/connection.php");
include (PREAMBLE."db_operations/db_functions.php");
include (PREAMBLE."assets/php/code_blocks.php");
$sessionsArray=getSessions($db);
if(isset($_GET["sch_id"])) {
    $id = $_GET["sch_id"];
}
if(isset($_POST['confirm'])){
    $id = $_POST['confirmId'];
    $content="<h2>Deleted</h2>";
    deleteSession($db,$id);

}else{
    $content="<h2>ATTENTION: LA SUPPRESSION D'UNE SESSION EST IRR&Eacute;VERSIBLE. VOULEZ VOUS CONTINUER?</h2>
    <form action='delete.php' method='post'>
    <input type='hidden' name='confirm' value='confirmed'>
    <input type='hidden' name='confirmId' value=$id>
    <input type='submit' value='Confirmer'><br><br><a style='' href='schedule_modification.php'>Retour</a>";
}




//TODO add option to create new semester and add files to it



$content.= "<!DOCTYPE HTML><html>";
block_print_document_header("Template",PREAMBLE);
$content.= "<body class=\"is-preload\">";
$content.= "<div id=\"page-wrapper\">";
block_print_header("","../");

session_start();
if(isset($_SESSION['user_id'])) {
    block_print_nav("");
    //TODO VALIDATE USER ACCESS
    block_print_main($content);
}else{
    block_print_nav("<li><a href='".PREAMBLE."login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>".$connection_form);
    session_destroy();
}
//put code in content



block_print_copyright();
$content.= "    </div>";
block_print_scripts("../");
$content.= "	</body>";
$content.= "</html>";


?>