<?php
define("PREAMBLE", "../");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");
include(PREAMBLE . "assets/php/code_blocks.php");
$sessionsArray = getSessions($db);
$form_data_schedule = "";
$sch_id = $_GET['sch_id'];

//TODO add option to create new semester and add files to it


$form_data_shift_list = "<form action=\"uploadShifts.php\" method=\"post\" enctype=\"multipart/form-data\">
    <h2>S&eacute;lectionner fichier CSV contenant la liste de cours de la session</h2>
    <p>Ensuite, appuyez sur charger et enfin sur mettre &agrave; jour. ATTENTION: Si des cours existent d&eacute;j&acirc; pour la session choisie, ils seront supprim&eacute;s pour faire place aux nouveaux</p>";

if (isset($_GET['message'])) {
    $form_data_shift_list .= "<div class=\"alert alert-danger\" role=\"alert\">
  Attention: Format du fichier invalide: veuillez charger un fichier conforme au guide d'utilisateur
</div><br>";
}

$result = $db->query("select sch_id, title from schedule");


$form_data_shift_list .= "<input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
<input type='hidden' value='$sch_id' name='sch_id'>
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form><form action='db_update_shifts.php' method='post' enctype='multipart/form-data'>";


$form_data_shift_list .= " 
 <input type='hidden' name='sch_id' value='$sch_id'>
<input type=\"submit\" value=\"Mettre &agrave; jour\" name=\"submit\">
</form>";

echo "<!DOCTYPE HTML><html>";
block_print_document_header("Ajouter Quart", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", "../");

session_start();
if (isset($_SESSION['user_id'])) {
    block_print_nav("");
    //TODO VALIDATE USER ACCESS
    block_print_main($form_data_schedule . $form_data_shift_list);
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
