<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Gestion de quart", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();
if (isset($_SESSION['user_id'])) {
    block_print_nav("");
    if (check_user_permissions($_SESSION['user_id'], 4) || check_user_permissions($_SESSION['user_id'], 3) || check_user_permissions($_SESSION['user_id'],2)) {

        echo "<section class=\"wrapper style2\" id=\"main\"><div class=\"inner\">";


        echo "<h1>Gestion de quart</h1>";
        $result = $db->query("SELECT * FROM schedule;");
        $form_data_shift_list = "Session: <form method='post'><select onchange='this.form.submit()' name='schedule'>";

        $form_data_shift_list .= '<option selected disabled> -- Choisissez une session -- </option>';
        if (isset($_POST['schedule'])) $_SESSION['current_session_schedule'] = $_POST['schedule'];

        while ($row = $result->fetch_assoc()) {

            $id = $row['sch_id'];
            $name = $row['title'];
            if (isset($_SESSION['current_session_schedule'])) {
                if ($id == $_SESSION['current_session_schedule']) $form_data_shift_list .= '<option selected value="' . $id . '">' . $name . '</option>';
                else $form_data_shift_list .= '<option value="' . $id . '">' . $name . '</option>';
            } else $form_data_shift_list .= '<option value="' . $id . '">' . $name . '</option>';

        }
        $form_data_shift_list .= '</select></form>';

        echo $form_data_shift_list;

        if (isset($_GET['status_message'])) echo '<h3 style="color: #0F0;">' . $_GET['status_message'] . '</h3>';


        if (isset($_SESSION['current_session_schedule'])) {

            $schedule = $_SESSION['current_session_schedule'];

            echo "<a href='create.php?session=$schedule'><button>Creer un quart</button></a><br/><br/>";


            $locationArray = getLocations($db);
            echo "<form method='get'><div class=\"row gtr-uniform\"><div class=\"col-12\"><select id='location' name='location' onchange='this.form.submit()'>";
            foreach ($locationArray as $location) {
                if (isset($_GET['location'])) {
                    if ($_GET['location'] == $location) {
                        echo "<option selected value='$location'>$location";
                    } else {
                        echo "<option value='$location'>$location";
                    }
                } else {
                    echo "<option value='$location'>$location";
                }
            }


            echo "</select></div></div></form><form method='post' action='edit.php'><input type='button' onclick='this.form.submit()' id='modify' style='display: none;' value='Modifier'><input type='hidden' name='shift_id' id='id'></form>";
            //Table for Schedule

            //Pills


            echo "<div class='row'><div class='col-2'>

        <nav class=\"nav flex-column nav-pills\">
        
          <a id='WD0' class=\"nav-link active\">Dimanche</a>
          
                    <a id='WD1' class=\"nav-link \">Lundi</a>
                    
                    <a id='WD2' class=\"nav-link \">Mardi</a>
                   
                    <a id='WD3' class=\"nav-link \">Mercredi</a>
                    
                    <a id='WD4' class=\"nav-link \">Jeudi</a>
                    
                    <a id='WD5' class=\"nav-link \">Vendredi</a>
                    
                    <a id='WD6' class=\"nav-link \">Samedi</a>
                   
          
          
        </nav></div>";
            echo "<div class='col-10'><div id='WD0T' class='col-12 table'>";
            $currentLocation = $locationArray[5];
            if (isset($_GET['location'])) {
                $currentLocation = $_GET['location'];
            }

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

            echo "</div></div></div>";
        }

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
echo "</div></section>";
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


    $('.shift').click(function() {
      
    
    var elementId = $(this).attr('id');
    console.log('Shift '+elementId+' selected.');
    $('#modify').slideDown();
    $('.shift').css('border', ''); 
    $('.shift').css('background-color', '');
    
    $('#'+elementId).css('border','2px solid #000');
    $('#'+elementId).css('background-color','#4dffa5');
    document.getElementById('id').value = elementId;
    });


</script><script>

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

$('.nav-link').click(function() {
    var elementId = $(this).attr('id');
    console.log(elementId+' selected.');
    
    $('.nav-link').removeClass('active');
    $('#'+elementId).addClass('active');
    
    $('.table').slideUp(350);
    $('#'+elementId+'T').delay(350).slideDown(350)
    
    
});

$('td').css('font-size','x-small');
    $('td').css('padding','5px');
    
    $(document).ready(function() {
        $('table').slideDown();
    });
   
    $('td.shift').each(function() {
      let start = $(this).data('start').substr(0,5);
      let end = $(this).data('end').substr(0,5);
      
      $(this).append('<br/>'+start+'-'+end);
    });
</script>";
echo "	</body>";
echo "</html>";