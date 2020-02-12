<?php
define("PREAMBLE","../");
include (PREAMBLE."db_operations/connection.php");
include (PREAMBLE."db_operations/db_functions.php");
include (PREAMBLE."assets/php/code_blocks.php");
$sessionsArray=getSessions($db);
$form_data_schedule="";


//TODO add option to create new semester and add files to it
$form_data_schedule .= "<form action=\"createSchedule.php\" method=\"post\" enctype=\"multipart/form-data\">
    <h2>Cr&eacute;er nouvel horaire</h2>
    Titre de l'horaire: <input type='text' name='title'><br>
    Date de d&eacute;but &nbsp; <input type='date' name='sch_start_date'><br><br>
    Date de fin &nbsp; <input type='date' name='sch_end_date'><br><br>
    Date limite pour la remise des disponibilit&eacute;s &nbsp; <input type='date' name='avail_deadline'>
    <br><br>
    <input type=\"submit\" value=\"Cr&eacute;er\" name=\"submit\">
</form>";

$form_data_shift_list = "<form action=\"uploadShifts.php\" method=\"post\" enctype=\"multipart/form-data\">
    <h2>S&eacute;lectionner fichier CSV contenant la liste de cours de la session</h2>
    <p>Ensuite, appuyez sur charger et enfin sur mettre &agrave; jour. ATTENTION: Si des cours existent d&eacute;j&acirc; pour la session choisie, ils seront supprim&eacute;s pour faire place aux nouveaux</p>";




$result = $db->query("select sch_id, title from schedule");



$form_data_shift_list .="<input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form><form action='db_update_shifts.php' method='post' enctype='multipart/form-data'>";

$form_data_shift_list .=  "Session: <select name='schedule'>";

while ($row = $result->fetch_assoc()) {

    $id = $row['sch_id'];
    $name = $row['title'];
    $form_data_shift_list .= '<option value="'.$id.'">'.$name.'</option>';

}

$form_data_shift_list .= "<h5>Mettre &agrave; jour les quarts de travail</h5><br></select><br>";



$form_data_shift_list .=" 

<input type=\"submit\" value=\"Mettre &agrave; jour\" name=\"submit\">
</form><hr><a style='text-decoration:none; ' href=\"schedule_modification.php\" class=\"btn btn-primary btn-lg\" role=\"button\" aria-pressed=\"true\">Modifier Sessions</a>";





echo "<!DOCTYPE HTML><html>";
block_print_document_header("Cr&eacute;er Horaire",PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("","../");

session_start();
if(isset($_SESSION['user_id'])) {
    block_print_nav("");
    //TODO VALIDATE USER ACCESS
    block_print_main($form_data_schedule . $form_data_shift_list);
}else{
    block_print_nav("<li><a href='".PREAMBLE."login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>".$connection_form);
    session_destroy();
}
//put code in content



block_print_copyright();
echo "    </div>";
block_print_scripts("../");
echo "	</body>";
echo "</html>";


?>