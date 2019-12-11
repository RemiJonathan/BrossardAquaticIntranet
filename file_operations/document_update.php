<?php
include('../assets/php/code_blocks.php');
echo "test";

$form_data = "<form action=\"uploadEmployeeList.php\" method=\"post\" enctype=\"multipart/form-data\">
<br>
    <p>S&eacute;lectionner fichier CSV contenant la liste d'employ&eacute;s.</p>
    <br>
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form><br><br><br><form action='db_update_emps.php' method='post' enctype='multipart/form-data'>
    <p>Mettre &agrave; jour la base de donn&eacute;es des employ&eacute;s</p>

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
block_print_main("");

block_print_copyright();
echo "    </div>";
block_print_scripts("../");
echo "	</body>";
echo "</html>";


?>