<?php
session_start();
define("PREAMBLE", "../../");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");
include(PREAMBLE . "assets/php/code_blocks.php");

$content = "";
//general info
$sch_id = $_GET['sch_id'];
$title = $_GET['title'];
$deadline = $_GET['deadline'];
$gen_info = $_GET['gen_info'];
$meet_info = $_GET['meet_info'];
$guidelines = $_GET['guidelines'];
//info for regular shifts
$dayArray = $_GET['day'];
$start_timeArray = $_GET['start_time'];
$end_timeArray = $_GET['end_time'];
$required_qualArray = $_GET['required_qual'];
$block_catArray = $_GET['block_cat'];

//info for special shifts
if (isset($_GET['spec_start_date'])) {
    $spec_start_dateArray = $_GET['spec_start_date'];
    $spec_end_dateArray = $_GET['spec_end_date'];
    $spec_start_timeArray = $_GET['spec_start_time'];
    $spec_end_timeArray = $_GET['spec_end_time'];
    $spec_required_qualArray = $_GET['spec_required_qual'];
    $spec_block_catArray = $_GET['spec_block_cat'];
}


insertAvailInstructions($db, $sch_id, $title, $deadline, $gen_info, $meet_info, $guidelines);

deleteAvailBlocks($db, $sch_id);
deleteSpecAvailBlocks($db, $sch_id);

for ($i = 0; $i < count($dayArray); $i++) {
    insertAvailBlocks($db, $sch_id, $dayArray[$i], $start_timeArray[$i], $end_timeArray[$i], $required_qualArray[$i], $block_catArray[$i]);
}
if (isset($_GET['spec_start_date'])) {
    for ($i = 0; $i < count($spec_start_dateArray); $i++) {
        insertSpecAvailBlocks($db, $sch_id, $spec_start_dateArray[$i], $spec_end_dateArray[$i], $spec_start_timeArray[$i], $spec_end_timeArray[$i], $spec_required_qualArray[$i], $spec_block_catArray[$i]);
    }
}

$content .= "<h1>Confirmation</h1>";
$content .= "<b>Titre: </b>" . $title;
$content .= "<br><b>Date Limite: </b>" . nl2br($deadline) . '<br>';
$content .= "<br><b>Infos G&eacute;n&eacute;rales: </b>" . nl2br($gen_info) . '<br><br>';
$content .= "<br><b>Infos Rencontre: </b>" . nl2br($meet_info) . '<br><br>';

$content .= "<br><b>Instructions: </b>" . nl2br($guidelines) . '<br><br>';

$content .= "<h2>Blocs de dispo</h2>";
for ($i = 0; $i < count($dayArray); $i++) {
    $content .= "$dayArray[$i]&nbsp;$start_timeArray[$i]-$end_timeArray[$i]&nbsp;
$required_qualArray[$i]&nbsp;$block_catArray[$i]<br>";
}
if (isset($_GET['spec_start_date'])) {
    $content .= "<br><h2>Blocs sp&eacute;ciaux</h2>";
    for ($i = 0; $i < count($spec_start_dateArray); $i++) {
        $content .= "$spec_start_dateArray[$i]-$spec_end_dateArray[$i]&nbsp;
$spec_start_timeArray[$i]-$spec_end_timeArray[$i]&nbsp;
$spec_required_qualArray[$i]&nbsp;$spec_block_catArray[$i]<br>";
    }
}
$content .= "<br><br><button><a href='../schedule_modification.php'>Retour</a></button>";
echo "<!DOCTYPE HTML><html>";
block_print_document_header("TCr&eacute;er Dispo", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", "../");
$sch_id = $_GET["sch_id"];

if (($_GET["title"] == "") || ($_GET["deadline"] == "")) {
    echo "<script>
alert('Vous devez choisir un titre pour la session et une date limite!');
window.location.replace('createAvailForm.php?sch_id=$sch_id');
</script>";
}

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
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "	</body>";
echo "</html>";


?>