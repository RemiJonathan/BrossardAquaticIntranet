<?php
include('../assets/php/code_blocks.php');

//TODO add veritification to check if the uploaded CSV file is actually the intended CSV
$form_data_emp_list = "<form action=\"uploadEmployeeList.php\" method=\"post\" enctype=\"multipart/form-data\">
<br>
    <h2>S&eacute;lectionner fichier CSV contenant la liste d'employ&eacute;s.</h2>
    <br>
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form><br><br><br><form action='db_update_emps.php' method='post' enctype='multipart/form-data'>
    <h5>Mettre &agrave; jour la base de donn&eacute;es des employ&eacute;s</h5>

<input type=\"submit\" value=\"Mettre &agrave; jour\" name=\"submit\">
</form> ";

$form_data_snr_list = "<form action=\"uploadQualList.php\" method=\"post\" enctype=\"multipart/form-data\">
<br>
    <h2>____________________________________________________________________________________
    <br>S&eacute;lectionner fichier CSV contenant la liste de qualifications des employ&eacute;s.</h2>
    <br>
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form><br><br><br><form action='db_update_quals.php' method='post' enctype='multipart/form-data'>
    <h5>Mettre &agrave; jour les qualifications des employ&eacute;s</h5>

<input type=\"submit\" value=\"Mettre &agrave; jour\" name=\"submit\">
</form> ";

echo "<!DOCTYPE HTML><html>";
block_print_document_header("Template","../");
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("");
//TODO: put logic to verify cookie and modify this
block_print_nav("<li><a href=\"login.php\">Connexion</a></li>");
//put code in content
block_print_main($form_data_emp_list . $form_data_snr_list);

block_print_copyright();
echo "    </div>";
block_print_scripts("../");
echo "	</body>";
echo "</html>";


?>