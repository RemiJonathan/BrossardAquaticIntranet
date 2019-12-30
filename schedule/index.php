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
        $content = "<h1>Gestion d'horaire</h1>";
        $content .= "<h2>selectionez une semaine</h2>";
        $content .= "<form><div class=\"row gtr-uniform\"><div class=\"col-12\"><input type='week' id='week' name='week' onchange='this.form.submit()'></div></div></form>";
        if (isset($_GET['week'])) {
            //Table for Schedule
            $content .= "<div class='row'><div class='table-wrapper col-8'>";

            $content .= "<table style='empty-cells: show' class=\"alt\">
    <tbody>
        <tr>
            <th style='width: 8%'></th>
            <th id='weekDay0' style='width: 12.85%'>Dimanche</th>
            <th id='weekDay1' style='width: 12.85%'>Lundi</th>
            <th id='weekDay2' style='width: 12.85%'>Mardi</th>
            <th id='weekDay3' style='width: 12.85%'>Mercredi</th>
            <th id='weekDay4' style='width: 12.85%'>Jeudi</th>
            <th id='weekDay5' style='width: 12.85%'>Vendredi</th>
            <th id='weekDay6' style='width: 12.85%'>Samedi</th>
        </tr>";

            $convertedWeekString = $_GET['week'][0].$_GET['week'][1].$_GET['week'][2].$_GET['week'][3].$_GET['week'][5].$_GET['week'][6].$_GET['week'][7];
            $content .='<tr><th></th>';
            for ($i = 0; $i<7; $i++){
                if (isset($_GET['week'])){
                    $content .= "<th><small class='small'>".date('d/m', strtotime($convertedWeekString.$i))."</small></th>";
                }else{

                }
            }
            $content .= '</tr>';

            $content .= "</tbody></table>";

            $content .= "</div></div>";
        } else {
            //Table for Schedule
            $content .= "<div class='table-wrapper'>";

            $content .= "<table>
    <tbody>
    <tr>
    <th></th>
    <th id='weekday1'  >Lundi</th>
    <th id='weekday2'  >Mardi</th>
    <th id='weekday3'  >Mercredi</th>
    <th id='weekday4'  >Jeudi</th>
    <th id='weekday5'  >Vendredi</th>
    <th id='weekday6'  >Samedi</th>
    <th id='weekday7'  >Dimanche</th>
</tr>
        <tr>
            <th>08:00</th>
        </tr>
        <tr>
            <th>08:30</th>
        </tr>
        <tr>
            <th>09:00</th>
        </tr>
        <tr>
            <th>09:30</th>
        </tr>
        <tr>
            <th>10:00</th>
        </tr>
        <tr>
            <th>10:30</th>
        </tr>
        <tr>
            <th>11:00</th>
        </tr>
        <tr>
            <th>11:30</th>
        </tr>
        <tr>
            <th>12:00</th>
        </tr>
        <tr>
            <th>12:30</th>
        </tr>
        <tr>
            <th>13:00</th>
        </tr>
        <tr>
            <th>13:30</th>
        </tr>
        <tr>
            <th>14:00</th>
        </tr>
        <tr>
            <th>14:30</th>
        </tr>
        <tr>
            <th>15:00</th>
        </tr>
        <tr>
            <th>15:30</th>
        </tr>
        <tr>
            <th>16:00</th>
        </tr>
        <tr>
            <th>16:30</th>
        </tr>
        <tr>
            <th>17:00</th>
        </tr>
        <tr>
            <th>17:30</th>
        </tr>
        <tr>
            <th>18:00</th>
        </tr>
        <tr>
            <th>18:30</th>
        </tr>
        <tr>
            <th>19:00</th>
        </tr>
        <tr>
            <th>19:30</th>
        </tr>
        <tr>
            <th>20:00</th>
        </tr>
        <tr>
            <th>20:30</th>
        </tr>
        <tr>
            <th>21:00</th>
        </tr>
    </tbody>
</table>";

            $content .= "</div></div>";
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

echo "	</body>";
echo "</html>";