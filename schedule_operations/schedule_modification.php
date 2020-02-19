<?php
define("PREAMBLE", "../");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");
include(PREAMBLE . "assets/php/code_blocks.php");
$sessionsArray = getSessions($db);
$content = "";

$content .= "<h2>Horaires Existants</h2>";
// Attempt select query execution
$sql = 'SELECT * FROM schedule';
if ($result = $db->query($sql)) {
    if ($result->num_rows > 0) {
        $content .= "<div class='row'><div class='col-12'><table class='table table-bordered table-striped'>";
        $content .= "<thead>";
        $content .= "<tr>";
        $content .= "<th>#</th>";
        $content .= "<th>Session</th>";
        $content .= "<th>Date de d&eacute;but</th>";
        $content .= "<th>Date de fin</th>";

        $content .= "<th>Action</th>";

        $content .= "</tr>";
        $content .= "</thead>";
        $content .= "<tbody>";
        while ($row = $result->fetch_array()) {
            $content .= "<form action='update.php' method='get'><tr>";
            $content .= "<td><input name='sch_id' style=\"width: 3em\" type='number' min=\"" . $row['sch_id'] . "\" max=\"" . $row['sch_id'] . "\" value=\"" . $row['sch_id'] . "\">" . "</td>";
            $content .= "<td><input name='title' type='text' value=\"" . $row['title'] . "\">" . "</td>";
            $content .= "<td><input name='sch_start_date' type='date' value=\"" . $row['sch_start_date'] . "\">" . "</td>";
            $content .= "<td><input name='sch_end_date' type='date' value=\"" . $row['sch_end_date'] . "\">" . "</td>";

            $content .= "<td>";
            $content .= "<input style='width:100%;font-size:9px;padding:2px;' type='submit' value='Modifier'></form>";
            $tempId = $row['sch_id'];
            $content .= "<br><br>" .
                "<form action='delete.php' method='get'><input type='hidden' name='sch_id' value='$tempId'><input style='width:100%;font-size:9px;padding:2px;' type='submit' value='Supprimer'></form>";

            $content .= "<form action='availability_operations/createAvailForm.php' method='get'><input type='hidden' name='sch_id' value='$tempId'><input style='width:100%;font-size:9px;padding:2px;' type='submit' value='Disponiblit&eacute;s'></form>";
            $content .= "<form action='schedule_add_shift.php' method='get'><input type='hidden' name='sch_id' value='$tempId'><input style='width:100%;font-size:9px;padding:2px;' type='submit' value='Quarts'></form></td>";

            $content .= "</tr>";
        }
        $content .= "</tbody>";
        $content .= "</table></div></div>";
        // Free result set
        $result->free();
    } else {
        $content .= "<p class='lead'><em>No records were found.</em></p>";
    }
} else {
    $content .= "ERROR: Could not able to execute $sql. " . $db->error;
}

// Close connection
$db->close();
$content .= "<a href='schedule_creation.php' >Cr&eacute;er Nouvelle Session</a></div></div>";


//TODO add option to create new semester and add files to it


$content .= "<!DOCTYPE HTML><html>";
block_print_document_header("Modifier Session", PREAMBLE);
$content .= "<body class=\"is-preload\">";
$content .= "<div id=\"page-wrapper\">";
block_print_header("", "../");

session_start();
if (isset($_SESSION['user_id'])) {
    block_print_nav("");
    //TODO VALIDATE USER ACCESS
    block_print_main($content);
} else {
    block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
    session_destroy();
}
//put code in content


block_print_copyright();
$content .= "    </div>";
block_print_scripts("../");
$content .= "	</body>";
$content .= "</html>";


?>