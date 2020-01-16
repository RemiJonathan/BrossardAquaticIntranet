<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();
if (isset($_SESSION['user_id'])) {
    if (check_user_permissions($_SESSION['user_id'], 2)) {

        if (!isset($_GET['week'])) $_GET['week'] = date('o-\WW');
        $convertedWeekString = $_GET['week'][0] . $_GET['week'][1] . $_GET['week'][2] . $_GET['week'][3] . $_GET['week'][5] . $_GET['week'][6] . $_GET['week'][7];

        $content = "<h1>Gestion d'horaire</h1>";
        $content .= "<h2>selectionez une semaine</h2>";
        $content .= "<ul class=\"nav nav-tabs\">
  <li class=\"nav-item\">
    <a class=\"nav-link active\" href=\"#\">Antoine Brossard</a>
  </li>
  <li class=\"nav-item\">
    <a class=\"nav-link\" href=\"#\">Complexe Aquatique</a>
  </li>
  <li class=\"nav-item\">
    <a class=\"nav-link inactive\" href=\"#\">Complex Aquatique</a>
  </li>
</ul>";

        if (isset($_GET['week'])) {
            //Table for Schedule
            $content .= "<br/><br/><div class='row'><div class='col-2'>
<nav class=\"nav flex-column nav-pills\">
  <a id='WD0' class=\"nav-link active\">Dimanche</a>
            <a id='WD1' class=\"nav-link \">Lundi</a>
            <a id='WD2' class=\"nav-link \">Mardi</a>
            <a id='WD3' class=\"nav-link \">Mercredi</a>
            <a id='WD4' class=\"nav-link \">Jeudi</a>
            <a id='WD5' class=\"nav-link \">Vendredi</a>
            <a id='WD6' class=\"nav-link \">Samedi</a>
  
</nav>
</div><div class='table-wrapper col-8'>";

            echo "<div id='WD0T' class='col-10 table'>";


            echo printWeekDayTable('Dimanche', $convertedWeekString, $db);

            echo "</div>";
            echo "<div id='WD1T' class='col-10 table'  style='display: none'>";

            echo printWeekDayTable('Lundi', $convertedWeekString, $db);

            echo "</div>";


            echo "<div id='WD2T' class='col-10 table'  style='display: none'>";

            echo printWeekDayTable('Mardi', $convertedWeekString, $db);

            echo "</div>";


            echo "<div id='WD3T' class='col-10 table'  style='display: none'>";

            echo printWeekDayTable('Mercredi', $convertedWeekString, $db);

            echo "</div>";


            echo "<div id='WD4T' class='col-10 table'  style='display: none;>";

            echo printWeekDayTable('Jeudi', $convertedWeekString, $db);

            echo "</div>";


            echo "<div id='WD5T' class='col-10 table' style='display: none'>";

            echo printWeekDayTable('Vendredi', $convertedWeekString, $db);

            echo "</div>";


            echo "<div id='WD6T' class='col-10 table' style='display: none'>";

            echo printWeekDayTable('Samedi', $convertedWeekString, $db);
            echo "</div>";

            $content .= "<div class='col-2'><div class=\"box\" style='background: rgba(99, 116, 133, 0.075); border-color: rgba(99, 116, 133, 0.25);'>";

            //Put lifeguRD MANAGEMENT HERE
            $content .= "<h5>Sauveteur</h5>";

            $content .= "</div></div>";

            $content .= "</div>";
        }
    } else {
        $content = '<h3>Vous n\'avez pas les permissions requises pour acc&egrave;der a cette page.</h3>';
    }
    block_print_nav("");
    block_print_main($content);
} else {
    block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
    session_destroy();
}
block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "<script>
//This script sets default week to current week
function getWeekNumber(d) {
    d = new Date(Date.UTC(d.getFullYear(), d.getMonth(), d.getDate()));
    d.setUTCDate(d.getUTCDate() + 4 - (d.getUTCDay()||7));
    var yearStart = new Date(Date.UTC(d.getUTCFullYear(),0,1));
    var weekNo = Math.ceil(( ( (d - yearStart) / 86400000) + 1)/7);
    return [d.getUTCFullYear(), weekNo];
}";
if (isset($_GET['week'])) {
    echo "document.getElementById(\"week\").value = '" . $_GET['week'] . "'";
} else {
    echo "let result = getWeekNumber(new Date()); document.getElementById(\"week\").value = result[0]+'-W'+result[1];";
}
echo "</script>";
echo "<script>

    $('.nav-link').click(function() {                            
        var elementId = $(this).attr('id');                      
        console.log(elementId+' selected.');                     
                                                                 
        $('.nav-link').removeClass('active');                    
        $('#'+elementId).addClass('active');                     
                                                                 
        $('.table').slideUp(350);                                
        $('#'+elementId+'T').delay(350).slideDown(350)           
    });                                                          
                                                             

</script>";
echo "	</body>";
echo "</html>";