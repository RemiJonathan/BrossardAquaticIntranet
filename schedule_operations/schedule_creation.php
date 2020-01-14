<?php
define("PREAMBLE","../");
include (PREAMBLE."db_operations/connection.php");

include (PREAMBLE."assets/php/code_blocks.php");

//TODO add option to create new semester and add files to it
$form_data_emp_list = "<form action=\"uploadShifts.php\" method=\"post\" enctype=\"multipart/form-data\">
    <h2>S&eacute;lectionner fichier CSV contenant la liste de cours de la session</h2>
    
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form><br><form action='db_update_shifts.php' method='post' enctype='multipart/form-data'>
    <h5>Mettre &agrave; jour les quarts de travail</h5>

<input type=\"submit\" value=\"Mettre &agrave; jour\" name=\"submit\">
</form> ";





echo "<!DOCTYPE HTML><html>";
block_print_document_header("Template",PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("","../");

session_start();
if(isset($_SESSION['user_id'])) {
    block_print_nav("");
    //TODO VALIDATE USER ACCESS
    block_print_main($form_data_emp_list);
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