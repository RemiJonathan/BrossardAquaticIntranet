<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();
if (isset($_SESSION['user_id'])) {
    if (check_user_permissions($_SESSION['user_id'], 2)) {

        if (!isset($_GET['week'])) $_GET['week'] = date('o-\WW');
        $schedule = $_GET['week'][0] . $_GET['week'][1] . $_GET['week'][2] . $_GET['week'][3] . $_GET['week'][5] . $_GET['week'][6] . $_GET['week'][7];

        echo "<section class=\"wrapper style2\" id=\"main\">
						<div class=\"inner\">";

        echo "<h1>Gestion d'horaire</h1>";
        $result = $db->query("SELECT * FROM schedule;");
        $form_data_shift_list = "Session: <form method='post'><select onchange='this.form.submit()' name='schedule'>";

        $form_data_shift_list .= '<option selected disabled> -- Choisissez une session -- </option>';
        if (isset($_POST['schedule'])) $_SESSION['current_session_schedule'] = $_POST['schedule'];

        while ($row = $result->fetch_assoc()) {

            $id = $row['sch_id'];
            $name = $row['title'];
            if ($_SESSION['current_session_schedule']) {
                if ($id == $_SESSION['current_session_schedule']) $form_data_shift_list .= '<option selected value="' . $id . '">' . $name . '</option>';
                else $form_data_shift_list .= '<option value="' . $id . '">' . $name . '</option>';
            } else $form_data_shift_list .= '<option value="' . $id . '">' . $name . '</option>';

        }
        $form_data_shift_list .= '</select></form>';

        echo $form_data_shift_list;

        if (isset($_GET['status_message'])) echo '<h3 style="color: #0F0;">' . $_GET['status_message'] . '</h3>';


        if (isset($_SESSION['current_session_schedule'])) {

            $schedule = $_SESSION['current_session_schedule'];

            $locationArray = getLocations($db);
            echo "<form><div class=\"row gtr-uniform\"><div class=\"col-12\"><ul class=\"nav nav-tabs\">";
            $counter = 0;
            foreach ($locationArray as $location) {
                if (isset($_GET['location'])) {
                    if ($_GET['location'] == $location) {
                        echo "<li class=\"nav-item\">
    <a class=\"nav-link active pool\" href=\"?location=$location\">$location</a></li>";
                    } else {
                        echo "<li class=\"nav-item\">
    <a class=\"nav-link pool\" href=\"?location=$location\">$location</a></li>";
                    }
                } else {
                    if ($counter == 0) {
                        $_GET['location'] = $location;
                        echo "<li class=\"nav-item\">
    <a class=\"nav-link pool active\" href=\"?location=$location\">$location</a></li>";
                    } else {
                        echo "<li class=\"nav-item\">
    <a class=\"nav-link pool\" href=\"?location=$location\">$location</a></li>";
                    }
                }
            }

            echo "</ul></div></div></form>";

            if (isset($_GET['week'])) {
                //Table for Schedule
                echo "<br/><br/><div class='row'><div class='col-2'>
<nav class=\"nav flex-column nav-pills\">
  <a id='WD0' class=\"nav-link table active\">Dimanche</a>
            <a id='WD1' class=\"nav-link table\">Lundi</a>
            <a id='WD2' class=\"nav-link table\">Mardi</a>
            <a id='WD3' class=\"nav-link table\">Mercredi</a>
            <a id='WD4' class=\"nav-link table\">Jeudi</a>
            <a id='WD5' class=\"nav-link table\">Vendredi</a>
            <a id='WD6' class=\"nav-link table\">Samedi</a>
  
</nav>
</div>";

                echo "<div class='col-7'><div id='WD0T' class='col-12 table' style='display: none'>";
                $currentLocation = $locationArray[5];
                if (isset($_GET['location'])) {
                    $currentLocation = $_GET['location'];
                }

                $schedule = 1;

                echo printWeekDayTable('Dimanche', $schedule, $db, $currentLocation);

                echo "</div>";
                echo "<div id='WD1T' class='col-12 table'  style='display: none'>";

                echo printWeekDayTable('Lundi', $schedule, $db, $currentLocation);

                echo "</div>";


                echo "<div id='WD2T' class='col-12 table'  style='display: none'>";

                echo printWeekDayTable('Mardi', $schedule, $db, $currentLocation);

                echo "</div>";


                echo "<div id='WD3T' class='col-12 table'  style='display: none'>";

                echo printWeekDayTable('Mercredi', $schedule, $db, $currentLocation);

                echo "</div>";


                echo "<div id='WD4T' class='col-12 table'  style='display: none;'>";

                echo printWeekDayTable('Jeudi', $schedule, $db, $currentLocation);

                echo "</div>";


                echo "<div id='WD5T' class='col-12 table' style='display: none'>";

                echo printWeekDayTable('Vendredi', $schedule, $db, $currentLocation);

                echo "</div>";


                echo "<div id='WD6T' class='col-12 table' style='display: none'>";

                echo printWeekDayTable('Samedi', $schedule, $db, $currentLocation);

                echo "</div></div>";

                echo "<div class='col-3'><div class=\"box\" style='background: rgba(99, 116, 133, 0.075); border-color: rgba(99, 116, 133, 0.25);'>";

                //Put lifeguRD MANAGEMENT HERE
                echo "<h5>Sauveteur</h5>";

                echo "<div class=\"col-12\"><input id='enseignement' name=\"seniority_type\" type=\"radio\"><label for=\"enseignement\">Enseignement</label></div>";
                echo "<div class=\"col-12\"><input id='surveillance' name=\"seniority_type\" type=\"radio\"><label for=\"surveillance\">Surveillance</label></div>";

                echo "<div class=\"col-12\">";



                echo "</div>";

                echo "</div></div>";

                echo "</div>";
                echo "</div>
					</section>";
            }
        }
    } else {
        $content = '<h3>Vous n\'avez pas les permissions requises pour acc&egrave;der a cette page.</h3>';
        block_print_main($content);
    }
    block_print_nav("");

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

var tables = document.getElementsByTagName('table');

for (let i = 0; i < tables.length; i++){
    let table = tables[i];
function normalizeTable() {
    var trs = table.getElementsByTagName('tr'), 
        len = trs.length, max = 0, td;
    // first we search for the longest table row in terms of # of children 
    for (var i = len; i--;) {
        if (trs[i].children.length > max) 
            max = trs[i].children.length;
    }
    // now we can fill the other rows
    for (var j = len; j--;) {
        while (trs[j].children.length < max) {
            td = document.createElement('td');
            trs[j].appendChild(td);
        }
    }
}
normalizeTable();
}

    

    $('.nav-link.table').click(function() {                            
        var elementId = $(this).attr('id');                      
        console.log(elementId+' selected.');                     
                                                                 
        $('.nav-link.table').removeClass('active');                    
        $('#'+elementId).addClass('active');                     
                                                                 
        $('div.table').fadeOut(350);                                
        $('#'+elementId+'T').delay(349).fadeIn(350)           
    });                                                          
                                                             
    $('.nav-link.table').css('font-size','medium');
    
    $('td').css('font-size','x-small');
    $('td').css('padding','5px');
    
    $('.nav-link.pool').click(function() {
           $('div.table').slideUp(350);
           $('.nav-link.table').removeClass('active');                    
           $('#WD0').addClass('active');   
    });
    
    $(document).ready(function() {
        $('#WD0T').slideDown(350); 
    });
    
</script>";
echo "	</body>";
echo "</html>";