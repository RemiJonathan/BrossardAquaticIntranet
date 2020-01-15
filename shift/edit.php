<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");


$get_shift_sql = "SELECT * FROM shift WHERE shift_id = '" . $db->real_escape_string($_POST['shift_id']) . "';";
$get_shift_res = $db->query($get_shift_sql);

$editing_shift = $get_shift_res->fetch_array();

$required_qual = $db->real_escape_string($editing_shift['required_qual']);
$start_time = $db->real_escape_string($editing_shift['start_time']);
$end_time = $db->real_escape_string($editing_shift['end_time']);
$day = $db->real_escape_string($editing_shift['day']);
$start_date = $db->real_escape_string($editing_shift['start_date']);
$end_date = $db->real_escape_string($editing_shift['end_date']);
$description = $db->real_escape_string($editing_shift['description']);

echo "<!DOCTYPE HTML><html>";
block_print_document_header("Gestion de quart", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();
if (isset($_SESSION['user_id'])) {
    block_print_nav("");
    if (check_user_permissions($_SESSION['user_id'], 2)) {
        $content = "<h1>Gestion de quart</h1>";
        if (isset($_GET['status_message'])) $content .= '<h3 style="color: #0F0;">' . $_GET['status_message'] . '</h3>';
        $content .= "<h2>modifier un quart</h2>";

        $content .= "<ul class=\"actions\"><li><a class=\"button\" href=\"../shift\" onclick='$(\".gtr-uniform\").slideUp()'>Retour</a></li></ul>";

        //$content .= "";
        $content .= "<form method='post' action='delete.php'><div class=\"row gtr-uniform\" style='display: none'>";

        /*$content .= "<label for='type'>Type de quart</label>";
        $content .= "<select name='type' id='type'><option>Surveillance</option><option>Enseignement</option></select>";
        */

        //Get all qualifications
        $content .= "<div class=\"col-12\"><label for='req_qual'>Qualification requise</label>";
        $content .= "<select name='required_qual' id='req_qual' required>";

        $all_quals_res = $db->query('SELECT * FROM qualification;');

        while ($qual = $all_quals_res->fetch_array()) {
            $content .= '<option value="' . $qual['qualification_id'] . '"';
            if ($qual['qualification_id'] == $required_qual) $content .= ' selected';
            $content .= '>' . $qual['qual_name'] . '</option>';
        }

        $content .= "</select></div>";


        $content .= "<div class=\"col-6\"><label>Heure de d&eacute;but</label>";
        $content .= "<input type='time' id='start_time' name='start_time' step='300' value='$start_time' required></div>";

        $content .= "<div class=\"col-4\"><label>Heure de fin</label>";
        $content .= "<input type='time' id='end_time' name='end_time' step='300' value='$end_time' required></div>";

        $content .= "<div class=\"col-6\"><label>Jour de la semaine</label><div class=\"col-12\">";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekSunday' value='Dimanche'";
        if ($day == "Dimanche") $content .= " checked";
        $content .= "><label for='weekSunday' required>Dimanche</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekMonday' value='Lundi'";
        if ($day == "Lundi") $content .= " checked";
        $content .= "><label for='weekMonday'>Lundi</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekTuesday' value='Mardi'";
        if ($day == "Mardi") $content .= " checked";
        $content .= "><label for='weekTuesday'>Mardi</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekWednesday' value='Mercredi'";
        if ($day == "Mercredi") $content .= " checked";
        $content .= "><label for='weekWednesday'>Mercredi</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekThursday' value='Jeudi'";
        if ($day == "Jeudi") $content .= " checked";
        $content .= "><label for='weekThursday'>Jeudi</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekFriday' value='Vendredi'";
        if ($day == "Vendredi") $content .= " checked";
        $content .= "><label for='weekFriday'>Vendredi</label></div>";
        $content .= "<div class=\"col-6\"><input type='radio' name='weekday' id='weekSaturday' value='Samedi'";
        if ($day == "Samedi") $content .= " checked";
        $content .= "><label for='weekSaturday'>Samedi</label></div></div></div>";

        //Potentially have the option of creating seasons
        $content .= "<div class=\"col-4\"><label>Date de d&eacute;but</label>";
        $content .= "<input type='date' id='start_date' name='start_date' value='$start_date' required>";

        $content .= "<label>Date de fin</label>";
        $content .= "<input type='date' id='end_date' name='end_date' value='$end_date' required></div>";


        $content .= "<div class=\"col-12\"><label for='description'>Description</label><textarea id=\"description\" name=\"description\" placeholder=\"Bain Libre\" maxlength='160' rows=\"6\" required>$description</textarea></div>";

        $content .= "<div class=\"col-12\"><ul class=\"actions\"><li><input type='hidden' name='shift_id' value='" . $db->real_escape_string($_POST['shift_id']) . "'><input type=\"submit\" value=\"Sauvegarder\" /></li></ul></div>";

        $content .= "</div></form>";

        block_print_main($content);
    } else {
        block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

        block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
        session_destroy();
    }
} else {
    block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
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