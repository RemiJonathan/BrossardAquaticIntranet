<?php
include('../db_operations/connection.php');
include('../db_operations/db_functions.php');

$filename = 'uploads/shifts_file.csv';
$content = "";
$message = "Fichier manquant, veuillez le charger avant de tenter de mettre a jour la base de donnees";
if (!(file_exists($filename))) {
    $content .= "<SCRIPT type='text/javascript'> 
        alert('$message');
        window.location.replace('schedule_creation.php');
    </SCRIPT>";
}
// The nested array to hold all the arrays
$shiftArray = [];
$sch_id = $_POST['sch_id'];

// Open the file for reading
if (($h = fopen("{$filename}", "r")) !== FALSE) {
    // Each line in the file is converted into an individual array that we call $data
    // The items of the array are comma separated

    $data = fgetcsv($h, 1000, ",");
    $message = $data[2];
    if (strtolower($data[1]) != "gr" || strtolower($data[2]) != "lieu" || strtolower($data[3]) != "descr") {

        header("location:schedule_add_shift.php?sch_id=$sch_id&message=$message");
        exit;
    }

    while (($data = fgetcsv($h, 1000, ",")) !== FALSE) {


        // Each individual array is being pushed into the nested array

        if (current($data) != "") {
            array_push($shiftArray, $data);
        } else {
            break;
        }
    }
    array_shift($shiftArray);

    // Close the file
    fclose($h);
}


// Display the code in a readable format
//Foreach employee $content .=  name

/**
 * Generate a random string, using a cryptographically secure
 * pseudorandom number generator (random_int)
 *
 * For PHP 7, random_int is a PHP core function
 * For PHP 5.x, depends on https://github.com/paragonie/random_compat
 *
 * @param int $length How many characters do we want?
 * @param string $keyspace A string of all possible characters
 *                         to select from
 * @return string
 * @throws Exception
 */


$qualArray = getQualArray($db);

$qualId = "";
deleteExistingShifts($db, $_POST["sch_id"]);
foreach ($shiftArray as $shift) {
    $qual = "MSA";
    $found = strpos(strtolower($shift[0]), strtolower("BAIN"));
    if ($found !== false) {
        $qual = "SN";
    }
    $found = strpos(strtolower($shift[0]), strtolower("SN"));
    if ($found !== false) {
        $qual = "MSN";
    }
    $found = strpos(strtolower($shift[0]), strtolower("PRE"));
    if ($found !== false) {
        $qual = "AQF";
    }
    $found = strpos(strtolower($shift[0]), strtolower("AQUA"));
    if ($found !== false) {
        $qual = "AQF";
    }
    $found = strpos(strtolower($shift[0]), strtolower("EB"));
    if ($found !== false) {
        $qual = "MS";
    }
    $found = strpos(strtolower($shift[0]), strtolower("MB"));
    if ($found !== false) {
        $qual = "MS";
    }
    $found = strpos(strtolower($shift[0]), strtolower("CB"));
    if ($found !== false) {
        $qual = "MS";
    }
    $found = strpos(strtolower($shift[0]), strtolower("PSG"));
    if ($found !== false) {
        $qual = "MSU";
    }
    $found = strpos(strtolower($shift[0]), strtolower("MSA"));
    if ($found !== false) {
        $qual = "ISA";
    }
    $found = strpos(strtolower($shift[0]), strtolower("ALERTE"));
    if ($found !== false) {
        $qual = null;
    }
    $found = strpos(strtolower($shift[0]), strtolower("MCPS"));
    if ($found !== false) {
        $qual = null;
    }
    $found = strpos(strtolower($shift[0]), strtolower("MCS"));
    if ($found !== false) {
        $qual = null;
    }
    $found = strpos(strtolower($shift[0]), strtolower("MASQUE"));
    if ($found !== false) {
        $qual = null;
    }


    if ($qual != null) {
        foreach ($qualArray as $possQual) {
            if ($qual == $possQual["qual_name"]) {
                $qualId = $possQual["qualification_id"];
            }
        }
    }


//$content.= $shift[0]." ".$qual."<br>";
    insertNewShift($db, $_POST["sch_id"], $qualId, $shift[5], $shift[6], $shift[2], $shift[4], $shift[0] . " GR-" . $shift[1], $shift[7], $shift[8]);

}


//$content.= var_dump($qualArray);

$content .= '<br><br><br><p>Mise &aacute; jour effectu&eacute;e</p><a href="schedule_modification.php">Retour</a>';


unlink($filename);
?>


<?php
define('PREAMBLE', '../');
include("../assets/php/code_blocks.php");

$content .= "<!DOCTYPE HTML><html>";

block_print_document_header("Base de Donn&eacute;es", PREAMBLE);
$content .= "<body class=\"is-preload\">";
$content .= "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
//TODO: put logic to verify cookie and modify this
block_print_nav("<li><a href=\"" . PREAMBLE . "login.php\">Connexion</a></li>");

//put code in content
block_print_main($content);

block_print_copyright();
$content .= "    </div>";
block_print_scripts(PREAMBLE);
$content .= "	</body>";
$content .= "</html>";
