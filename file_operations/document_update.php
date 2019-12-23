<?php
define("PREAMBLE","../");
include (PREAMBLE."assets/php/code_blocks.php");
include (PREAMBLE."db_operations/connection.php");

//TODO add veritification to check if the uploaded CSV file is actually the intended CSV
$form_data_emp_list = "<form action=\"uploadEmployeeList.php\" method=\"post\" enctype=\"multipart/form-data\">
    <h2>S&eacute;lectionner fichier CSV contenant la liste d'employ&eacute;s.</h2>
    
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form><br><form action='db_update_emps.php' method='post' enctype='multipart/form-data'>
    <h5>Mettre &agrave; jour la base de donn&eacute;es des employ&eacute;s</h5>

<input type=\"submit\" value=\"Mettre &agrave; jour\" name=\"submit\">
</form> ";

$form_data_qual_list = "<form action=\"uploadQualList.php\" method=\"post\" enctype=\"multipart/form-data\">

    <hr style=\"height:3px;border:none;color:#333;background-color:#333;\" />
    <h2>S&eacute;lectionner fichier CSV contenant la liste de qualifications des employ&eacute;s.</h2>
    
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form><br><form action='db_update_quals.php' method='post' enctype='multipart/form-data'>
    <h5>Mettre &agrave; jour les qualifications des employ&eacute;s</h5>

<input type=\"submit\" value=\"Mettre &agrave; jour\" name=\"submit\">
</form> ";

$form_data_snr_list = "<form action=\"uploadSurvSnrList.php\" method=\"post\" enctype=\"multipart/form-data\">

    <hr style=\"height:3px;border:none;color:#333;background-color:#333;\" />
    <h2>S&eacute;lectionner les deux fichiers CSV contenant l'anciennet&eacute; (Surveillance et Enseignement)</h2>
    <h3>Surveillance</h3>
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form>

<form action='db_update_surv_snr.php' method='post' enctype='multipart/form-data'>
    <h5>Mettre &agrave; jour la liste d'anciennet&eacute; de surveillance</h5>

<input type=\"submit\" value=\"Mettre &agrave; jour\" name=\"submit\">
</form>
<hr>
<form action=\"uploadEnsSnrList.php\" method=\"post\" enctype=\"multipart/form-data\">

     <h3>Enseignement</h3>
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form>
<form action='db_update_ens_snr.php' method='post' enctype='multipart/form-data'>
    <h5>Mettre &agrave; jour la liste d'anciennet&eacute; d'enseignement</h5>

<input type=\"submit\" value=\"Mettre &agrave; jour\" name=\"submit\">
</form>
<br>
 ";


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Template",PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("","../");

session_start();
if(isset($_SESSION['user_id'])) {
    block_print_nav("");
    //TODO VALIDATE USER ACCESS
    block_print_main($form_data_emp_list . $form_data_qual_list. $form_data_snr_list);
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