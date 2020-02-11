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

            $locationArray = getLocations($db);
            echo "<form><div class=\"row gtr-uniform\"><div class=\"col-12\"><ul class=\"nav nav-tabs\">";
            $counter = 0;
            foreach ($locationArray as $location) {
                        echo "<li class=\"nav-item\"><a class=\"nav-link pool\" id='$location'>$location</a></li>";
            }

            echo "</ul></div></div></form>";

            if (isset($_GET['week'])) {
                //Table for Schedule
                echo "<br/><br/><div class='row'><div class='col-2'>
<nav class=\"nav flex-column nav-pills\" style='position: sticky; top: 150px;'>
  <a id='WD0' class=\"nav-link table active\">Dimanche</a>
            <a id='WD1' class=\"nav-link table\">Lundi</a>
            <a id='WD2' class=\"nav-link table\">Mardi</a>
            <a id='WD3' class=\"nav-link table\">Mercredi</a>
            <a id='WD4' class=\"nav-link table\">Jeudi</a>
            <a id='WD5' class=\"nav-link table\">Vendredi</a>
            <a id='WD6' class=\"nav-link table\">Samedi</a>
  
</nav>
</div>";
                /*$currentLocation = $locationArray[5];
                if (isset($_GET['location'])) {
                    $currentLocation = $_GET['location'];
                }*/

                echo "<div class='col-7'><div id='WD0T' class='col-12 table' style='display: none'>";

                foreach ($locationArray as $key => $currentLocation) {
                    echo printWeekDayTable('Dimanche', $schedule, $db, $currentLocation);
                }

                echo "</div>";
                echo "<div id='WD1T' class='col-12 table'  style='display: none'>";

                foreach ($locationArray as $currentLocation) {
                    echo printWeekDayTable('Lundi', $schedule, $db, $currentLocation);
                }

                echo "</div>";


                echo "<div id='WD2T' class='col-12 table'  style='display: none'>";

                foreach ($locationArray as $currentLocation) {
                    echo printWeekDayTable('Mardi', $schedule, $db, $currentLocation);
                }

                echo "</div>";


                echo "<div id='WD3T' class='col-12 table'  style='display: none'>";

                foreach ($locationArray as $currentLocation) {
                    echo printWeekDayTable('Mercredi', $schedule, $db, $currentLocation);
                }

                echo "</div>";


                echo "<div id='WD4T' class='col-12 table'  style='display: none;'>";

                foreach ($locationArray as $currentLocation) {
                    echo printWeekDayTable('Jeudi', $schedule, $db, $currentLocation);
                }

                echo "</div>";


                echo "<div id='WD5T' class='col-12 table' style='display: none'>";

                foreach ($locationArray as $currentLocation) {
                    echo printWeekDayTable('Vendredi', $schedule, $db, $currentLocation);
                }

                echo "</div>";


                echo "<div id='WD6T' class='col-12 table' style='display: none'>";

                foreach ($locationArray as $currentLocation) {
                    echo printWeekDayTable('Samedi', $schedule, $db, $currentLocation);
                }

                echo "</div></div>";

                echo "<div class='col-3'><div id='lifeguard_block' class=\"box\" style='background: rgba(99, 116, 133, 0.075); border-color: rgba(99, 116, 133, 0.25);position: sticky; top: 150px;'>";

                //Put lifeguRD MANAGEMENT HERE
                //echo "<h5>Sauveteur</h5>";

                echo "<div class=\"col-12\"><input id='enseignement' name=\"seniority_type\" type=\"radio\"><label for=\"enseignement\" style='font-size: small'>Enseignement</label></div>";
                echo "<div class=\"col-12\"><input id='surveillance' name=\"seniority_type\" type=\"radio\"><label for=\"surveillance\" style='font-size: small'>Surveillance</label></div>";

                echo "<div class=\"col-12\"><span id='selectedHours' style='font-size: small'></span></div>";

                //Pastilles
                echo "<div class=\"col-12 container row\" style='margin: auto'>";
                echo "<div class='col-3 qual' id='qual-1'>SN</div>&nbsp;&nbsp;";

                echo "<div class='col-3 qual' id='qual-2'>MSA</div>&nbsp;&nbsp;";
                echo "<div class='col-3 qual' id='qual-3'>MS</div>&nbsp;&nbsp;";
                echo "<div class='col-3 qual' id='qual-4'>MSU</div>&nbsp;&nbsp;";
                echo "<div class='col-3 qual' id='qual-5'>MSN</div>&nbsp;&nbsp;";
                echo "<div class='col-3 qual' id='qual-6'>ISA</div>&nbsp;&nbsp;";
                echo "<div class='col-3 qual' id='qual-7'>AQF</div>&nbsp;&nbsp;";
                echo "<div class='col-3 qual' id='qual-8'>MSA + SN</div>&nbsp;&nbsp;";
                echo "<div class='col-3 qual' id='qual-9'>AQF + SN</div>";
                echo "</div>";

                echo "<div class=\"col-12\">";

                print_seniority_dropdown('surveillance', $db);
                print_seniority_dropdown('enseignement', $db);

                echo "</div>";

                echo "<br /><div class=\"col-12\"><form action='save_schedule.php' method='post'><div id='hiddenInputs'></div><ul class=\"actions\"><li><input style='display: none' type='submit' id='hiddenSave' value='sauvegarder'></li></ul></form></div></div></div>";

                echo "</div>";

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
echo "</div>
					</section>";
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

    for (let i = 0; i < tables.length; i++) {
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


    $('.nav-link.table').click(function () {
        var elementId = $(this).attr('id');
        console.log(elementId + ' selected.');

        $('.nav-link.table').removeClass('active');
        $('#' + elementId).addClass('active');

        $('div.table').fadeOut(350);
        $('#' + elementId + 'T').delay(349).fadeIn(350)
    });

    $('.nav-link.table').css('font-size', 'medium');

    $('td').css('font-size', 'x-small');
    $('td').css('padding', '5px');

    /*$('.nav-link.pool').click(function () {
        $('div.table').slideUp(350);
        $('.nav-link.table').removeClass('active');
        $('#WD0').addClass('active');
    });*/

    $(document).ready(function () {
        $('#WD0T').slideDown(350);
    });

    $('input').click(function () {
        let elementId = $(this).attr('id');
        $('.list-group').slideUp(350);
        $('.list-group-item.list-group-item-action.active').removeClass('active');
        $('.list-group.' + elementId).delay(349).slideDown(350);
    });

    $('.list-group-item.list-group-item-action').click(function () {

        $('.list-group-item.list-group-item-action.active').removeClass('active');
        $(this).addClass('active');
        var userID = $('.list-group-item.list-group-item-action.active').attr('id');
        $('.shift.selected').css('background', 'LightGray');
        $('.' + userID).css('background', '#99FFFF');
        
        $('.qual').each(function() {
            let qualID = $(this).attr('id');
            let expiryDate = $('#'+userID).data(qualID+'-exp');
            if (expiryDate != undefined){
                let diff = monthDiff(new Date(), new Date(expiryDate.toString()));
                if(qualID ==='qual-7') $(this).css('background-color','green');  
                else if (diff<1) $(this).css('background-color','red');
                else if (diff<4) $(this).css('background-color','yellow');
                else if (diff>=4) $(this).css('background-color','green');
            console.log(expiryDate + ' ' + monthDiff(new Date(), new Date(expiryDate.toString())));
            }else $(this).css('background-color','#00000000');
        });
        
        
        
        let hours = 0;
        let lowest = new Date('1970-1-1 23:59');
        let highest = new Date('1970-1-1 00:00');
        
        let hoursString = '';
        
        let poolID = $('.nav-link.pool.active').attr('id');
        
        $('table.'+poolID).each(function () {
            let tableId = $(this).attr('id');

            let start = new Date();
            let end = new Date();

            $('#' + tableId + ' .' + userID).each(function () {

                start = new Date('1970-1-1 ' + $(this).data('start'));
                //console.log(start);
                end = new Date('1970-1-1 ' + $(this).data('end'));
                //console.log(end);


                if (start < lowest) lowest = start;
                if (end > highest) highest = end;

                //$('.shift[class*=\' end\']\"').class();

                $('#hiddenSave').slideDown();

                //Add the shift to the list to save

            });


            hours = ((highest - lowest) / 1000 / 60 / 60);

            //console.log(lowest +'-'+highest+' | '+hours+'h');

            let totalMinutes = (hours * 60);

            let trueHours = Math.floor(totalMinutes / 60);
            let minutes = Math.floor(totalMinutes % 60);

            
            if (hours > 0) {
                
                console.log($(this).attr('id'));
                console.log(hoursString);
                
                hoursString +='<li>'+tableId+ ': '+ trueHours + ' heures ';    
            if (minutes !== 0) hoursString += minutes + ' minutes';
                hoursString +='</li>';

            }
            lowest = new Date('1970-1-1 23:59');
            highest = new Date('1970-1-1 00:00');
        });
        //TODO: Change the way total time is calculated

        $('#selectedHours').html(hoursString);
    });
    $('.shift.selected').css('background', 'LightGray');
    $('td.shift').click(function () {
        var userID = $('.list-group-item.list-group-item-action.active').attr('id');
        var elementId = $(this).attr('id');
        let hoursString = '';
        $(this).removeClass();
        $(this).addClass('shift');
        $(this).addClass(userID);
        if (userID !== undefined){ 
            $(this).addClass('selected');
            $('#hiddenInputs').append('<input type=\'hidden\' name=\'shift[]\' value=\''+elementId+'\'/><input type=\'hidden\' name=\'user[]\' value=\''+userID.substring(4)+'\'/>');
            console.log('Added '+ '<input type=\'hidden\' name=\'shift[]\' value=\''+elementId+'\'/><input type=\'hidden\' name=\'user[]\' value=\''+userID.substring(4)+'\'/>')
        }
        console.log('Shift ' + elementId + ' assigned to ' + userID);
        $('.shift.selected').css('background', 'LightGray');
        $('.' + userID).css('background', '#FF99FF');
        
        let hours = 0;
        let lowest = new Date('1970-1-1 23:59');
        let highest = new Date('1970-1-1 00:00');
        
        let poolID = $('.nav-link.pool.active').attr('id');
        
        $('table.'+poolID).each(function () {
            let tableId = $(this).attr('id');

            let start = new Date();
            let end = new Date();

            $('#' + tableId + ' .' + userID).each(function () {

                start = new Date('1970-1-1 ' + $(this).data('start'));
                //console.log(start);
                end = new Date('1970-1-1 ' + $(this).data('end'));
                //console.log(end);


                if (start < lowest) lowest = start;
                if (end > highest) highest = end;

                //$('.shift[class*=\' end\']\"').class();

                $('#hiddenSave').slideDown();

                //Add the shift to the list to save

            });


            hours = ((highest - lowest) / 1000 / 60 / 60);

            //console.log(lowest +'-'+highest+' | '+hours+'h');

            let totalMinutes = (hours * 60);

            let trueHours = Math.floor(totalMinutes / 60);
            let minutes = Math.floor(totalMinutes % 60);

            
            if (hours > 0) {
                
                console.log($(this).attr('id'));
                console.log(hoursString);
                
                hoursString +='<li>'+tableId+ ': '+ trueHours + ' heures ';    
            if (minutes !== 0) hoursString += minutes + ' minutes';
                hoursString +='</li>';

            }
            lowest = new Date('1970-1-1 23:59');
            highest = new Date('1970-1-1 00:00');
        });
        //TODO: Change the way total time is calculated

        $('#selectedHours').html(hoursString);
    });

function monthDiff(dateFrom, dateTo) {
 return dateTo.getMonth() - dateFrom.getMonth() + 
   (12 * (dateTo.getFullYear() - dateFrom.getFullYear()))
}

$('.nav-link.pool').click(function() {
    $('.nav-link.pool').removeClass('active');
  $(this).addClass('active');
  let locationID = $(this).attr('id');
  let weekDayID = $('.nav-link.table.active').attr('id');
  $('.col-12.table').slideUp(350);
  $('#'+weekDayID+'T').delay(350).slideDown(350);
  
  $('table').slideUp(350);
  $('table.'+locationID).delay(350).slideDown(350);
  
});

$('td.shift').each(function() {
      let start = $(this).data('start').substr(0,5);
      let end = $(this).data('end').substr(0,5);
      
      $(this).append('<br/>'+start+'-'+end);
    });

$('td.shift').click(function() {
    let userID = $('.list-group-item.list-group-item-action.active').attr('id');
    let shiftID = $(this).attr('id');
    let weekDay = $(this).closest('table').attr('id');
    let i = 0;
    
    $('#'+weekDay).each(function() {
      console.log(i);
      i++;
    })
    
  $('td.shift.user'+userID).each(function() {
    
  });
});
</script>";
echo "	</body>";
echo "</html>";