

<?php
define("PREAMBLE", "../");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");
include(PREAMBLE . "assets/php/code_blocks.php");
$sessionsArray = getSessions($db);
$form_data_schedule = "";


//TODO add option to create new semester and add files to it
$form_data_schedule .= "<form action=\"createSchedule.php\" method=\"post\" enctype=\"multipart/form-data\">
    <h2>Cr&eacute;er nouvel horaire</h2>
    Titre de l'horaire: <input type='text' name='title'><br>
    Date de d&eacute;but &nbsp; <input type='date' name='sch_start_date'><br><br>
    Date de fin &nbsp; <input type='date' name='sch_end_date'><br><br>
    
    <input type=\"submit\" value=\"Cr&eacute;er\" name=\"submit\">
</form>";





echo "<!DOCTYPE HTML><html>";
block_print_document_header("Template", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", "../");

session_start();
if (isset($_SESSION['user_id'])) {
    block_print_nav("");
    //TODO VALIDATE USER ACCESS
    block_print_main($form_data_schedule);
} else {
    block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
    session_destroy();
}
//put code in content


block_print_copyright();
echo "    </div>";
block_print_scripts("../");
echo "	</body>";
echo "</html>";


?>
