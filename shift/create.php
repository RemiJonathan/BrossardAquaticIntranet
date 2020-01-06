<?php
define('PREAMBLE', '../');
include (PREAMBLE."assets/php/code_blocks.php");
include (PREAMBLE."db_operations/connection.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Gestion de quart",PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();
if(isset($_SESSION['user_id'])) {
    block_print_nav("");
    if (check_user_permissions($_SESSION['user_id'], 2)){
        $content = "<h1>Gestion de quart</h1>";
        if(isset($_GET['status_message'])) $content.='<h3 style="color: #0F0;">'.$_GET['status_message'].'</h3>';
        $content .= "<h2>creer un quart</h2>";

        $content .= "<ul class=\"actions\"><li><a class=\"button\" href=\"../shift\">Retour</a></li></ul>";

        //$content .= "";
        $content .= "<form method='post' action='create_shift.php'><div class=\"row gtr-uniform\" style='display: none'>";

        /*$content .= "<label for='type'>Type de quart</label>";
        $content .= "<select name='type' id='type'><option>Surveillance</option><option>Enseignement</option></select>";
        */

        //Get all qualifications
        $content .= "<div class=\"col-12\"><label for='req_qual'>Qualification requise</label>";
        $content .= "<select name='required_qual' id='req_qual' required>";

        $content .= "<option label='' disabled selected>";
        $all_quals_res = $db->query('SELECT * FROM qualification;');

        while ($qual = $all_quals_res->fetch_array()) $content .= '<option value="'.$qual['qualification_id'].'">'.$qual['qual_name'].'</option>';

        $content .= "</select></div>";


        $content .= "<div class=\"col-6\"><label>Heure de d&eacute;but</label>";
        $content .= "<input type='time' id='start_time' name='start_time' step='900' required></div>";

        $content .= "<div class=\"col-4\"><label>Heure de fin</label>";
        $content .= "<input type='time' id='end_time' name='end_time' step='900' required></div>";

        $content .= "<div class=\"col-6\"><label>Jour de la semaine</label><div class=\"col-12\">";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekSunday' value='Dimanche'><label for='weekSunday' required>Dimanche</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekMonday' value='Lundi'><label for='weekMonday'>Lundi</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekTuesday' value='Mardi'><label for='weekTuesday'>Mardi</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekWednesday' value='Mercredi'><label for='weekWednesday'>Mercredi</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekThursday' value='Jeudi'><label for='weekThursday'>Jeudi</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekFriday' value='Vendredi'><label for='weekFriday'>Vendredi</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekSaturday' value='Samedi'><label for='weekSaturday'>Samedi</label></div></div></div>";

        //Potentially have the option of creating seasons
        $content .= "<div class=\"col-4\"><label>Date de d&eacute;but</label>";
        $content .= "<input type='date' id='start_date' name='start_date'required>";

        $content .= "<label>Date de fin</label>";
        $content .= "<input type='date' id='end_date' name='end_date'></div>";

        $content .= "<div class=\"col-12\"><label for='description'>Description</label><textarea id=\"description\" name=\"description\" placeholder=\"Bain Libre\" maxlength='160' rows=\"6\" required></textarea></div>";

        $content .="<div class=\"col-12\"><ul class=\"actions\"><li><input type=\"submit\" value=\"Sauvegarder\" /></li></ul></div>";

        $content .= "</div></form>";

        block_print_main($content);
    }else{
        block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

        block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
        session_destroy();
    }
}else{
    block_print_nav("<li><a href='".PREAMBLE."login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>".$connection_form);
    session_destroy();
}
block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "<script>";
if (isset($_GET['week'])) {
    echo "document.getElementById(\"week\").value = '" . $_GET['week'] . "'";
} else {
    echo "let result = getWeekNumber(new Date()); document.getElementById(\"week\").value = result[0]+'-W'+result[1];";
}
echo "</script>";
echo "<script>
$(document).ready(function(){
    $(\".gtr-uniform\").slideDown();
}); 
</script>";
echo "	</body>";
echo "</html>";