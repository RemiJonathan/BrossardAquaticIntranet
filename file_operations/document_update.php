<?php
echo "<!DOCTYPE html>
<html>
<body>

<form action=\"uploadEmployeeList.php\" method=\"post\" enctype=\"multipart/form-data\">
<br>
    <p>S&eacute;lectionner fichier CSV contenant la liste d'employ&eacute;s.</p>
    <br>
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form>

<br><br><br>
<form action='db_update_emps.php' method='post' enctype='multipart/form-data'>
    <p>Mettre &agrave; jour la base de donn&eacute;es des employ&eacute;s</p>

<input type=\"submit\" value=\"Mettre &agrave; jour\" name=\"submit\">
</form> 


</body>
</html>";

