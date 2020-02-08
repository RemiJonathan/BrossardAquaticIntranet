<?php
define('PREAMBLE', '../../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");
$sch_id = "";
$user_id = "";
$content = "";
if (isset($_POST['sch_id'])) {
    $sch_id = $_POST['sch_id'];
}
if (isset($_POST['user_id'])) {
    $user_id = $_POST['user_id'];
    $availType = $_POST['availType'];
    $comments = $_POST['comments'];
    $maxHours = $_POST['maxHours'];
    $availArray = $_POST['isAvail'] ?? null;
    $specAvailArray = $_POST['isAvailSpec'] ?? null;
    $schedules = getSchedules($db);
}

deleteUserSemAvails($db, $sch_id, $user_id);
deleteUserBlockAvails($db, $sch_id, $user_id);
deleteSpecUserBlockAvails($db, $sch_id, $user_id);

insertUserSemAvails($db, $user_id, $sch_id, date('Y-m-d'), $availType, $comments, $maxHours);
if ($availType == 'avail') {
    if ($availArray != null) {
        for ($i = 0; $i < count($availArray); $i++) {
            insertUserBlockAvails($db, $availArray[$i], $user_id, $sch_id);
        }
    }
}
if ($availType == 'avail') {
    if ($specAvailArray != null) {
        for ($i = 0; $i < count($specAvailArray); $i++) {
            insertSpecUserBlockAvails($db, $specAvailArray[$i], $user_id, $sch_id);
        }
    }
}
$userAvailabilities = getUserAvailabilities($db, $user_id, $sch_id);
$specUserAvailabilities = getSpecUserAvailabilities($db, $user_id, $sch_id);
//echo var_dump(getAvailBlock($db,$userAvailabilities[0]['block_id']));

$frenchAvailType = "";

if ($availType == 'avail') {
    $frenchAvailType = 'UN HORAIRE R&Eacute;GULIER';
}

$content .= "<h1>Confirmation</h1>";
$content .= "<p><b>Identifiant: </b> $user_id</p>";
$content .= "<p><b>Date de transmission: </b>" . date('Y-m-d') . "</p>";
$content .= "<p><b>Type de disponibilit&eacute: </b> Pour la session " . getSchedule($db, $sch_id)['title'] . ", tu es disponible pour: <i>" . $frenchAvailType . "</i></p>";
$content .= "<p><b>Heures maximales: </b>" . $maxHours . "</p>";
$content .= "<p><b>Commentaires: </b>" . $comments . "</p>";
$content .= "<h2>Tu es disponible pour les blocs suivants:</h2>
<list>";
if ($availType != 'avail') {
    $content .= '<p>Aucun quart! Pour demander un quart r&eacute;gulier, cocher l&apos;option appropri&eacute;e.</p>';
} else {

    foreach ($userAvailabilities as $avail) {
        $block = getAvailBlock($db, $avail['block_id']);
        $content .= "<li>" . $block['day'] . " " . date("H:i", strtotime($block['start_time'])) . "-" . date("H:i", strtotime($block['end_time'])) . " en tant que " . getQual($db, $block['required_qual'])['qual_name'] . "</li>";
    }
    if (sizeof($userAvailabilities) == 0) {
        $content .= "<i>Aucun</i>";
    }
}
$content .= "<br><br><h4>Blocs Sp&eacute;ciaux</h4>";
foreach ($specUserAvailabilities as $avail) {
    $endDate = "";
    if ($endDate != null) {
        $endDate = $block['end_date'];
    }
    if ($endDate != null || $endDate != "0000-00-00") {

    }
    $block = getSpecAvailBlock($db, $avail['block_id']);
    $content .= "<li>" . $block['start_date'] . $endDate . " " . date("H:i", strtotime($block['start_time'])) . "-" . date("H:i", strtotime($block['end_time'])) . " en tant que " . getQual($db, $block['required_qual'])['qual_name'] . " pour " . $block['block_cat'] . "</li>";
}


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();

block_print_nav("<li></li>");
block_print_main($content);

block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);

echo "	</body>";
echo "</html>";
