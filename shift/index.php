<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");


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
        $content .= "<a href='create.php'><button>Creer un quart</button></a><br/><br/>";

        if (!isset($_GET['week'])) $_GET['week'] = date('o-\WW');
        $convertedWeekString = $_GET['week'][0] . $_GET['week'][1] . $_GET['week'][2] . $_GET['week'][3] . $_GET['week'][5] . $_GET['week'][6] . $_GET['week'][7];

        $content .= "<form><div class=\"row gtr-uniform\"><div class=\"col-12\"><input type='week' id='week' name='week' onchange='this.form.submit()'></div></div></form><form method='post' action='edit.php'><input type='button' onclick='this.form.submit()' id='modify' style='display: none;' value='Modifier'><input type='hidden' name='shift_id' id='id'></form>";
        //Table for Schedule
        $content .= "<div class='row'><div class='10'>";

        $content .= printWeekDayTable('Dimanche', $convertedWeekString, $db);

        $content .= "</div>";

        $content .= "<div class='10' style='display: none'>";

        $content .= printWeekDayTable('Lundi', $convertedWeekString, $db);

        $content .= "</div>";

        $content .= "<div class='10'  style='display: none'>";

        $content .= printWeekDayTable('Mardi', $convertedWeekString, $db);

        $content .= "</div>";

        $content .= "<div class='10'  style='display: none'>";

        $content .= printWeekDayTable('Mercredi', $convertedWeekString, $db);

        $content .= "</div>";


        /* $content .= "<div class='10'  style='display: none'>";

        $content .= printWeekDayTable('Jeudi', $convertedWeekString, $db);

        $content .= "</div>";

        $content .= "<div class='10' style='display: none'>";

        $content .= printWeekDayTable('Vendredi', $convertedWeekString, $db);

        $content .= "</div>";

        $content .= "<div class='10' style='display: none'>";

        $content .= printWeekDayTable('Samedi', $convertedWeekString, $db);

        $content .= "</div></div>"; */


        block_print_main($content . "<div class=' 12'>");
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


    $('.shift').click(function() {
      
    
    var elementId = $(this).attr('id');
    console.log('Shift '+elementId+' selected.');
    $('#modify').slideDown();
    $('.shift').css('border', 'inherit');
    $('#'+elementId).css('border','2px solid #000');
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

</script>";
echo "	</body>";
echo "</html>";