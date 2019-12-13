<?php
include('../db_operations/connection.php');
include ('../db_operations/db_functions.php');

$filename = 'uploads/list_surv_snr.csv';
$content ="";
// The nested array to hold all the arrays
$snrArray = [];

// Open the file for reading
if (($h = fopen("{$filename}", "r")) !== FALSE)
{
    // Each line in the file is converted into an individual array that we call $data
    // The items of the array are comma separated
    while (($data = fgetcsv($h, 1000, ",")) !== FALSE) {
        // Each individual array is being pushed into the nested array

        if (current($data) != 0) {
            array_push($snrArray, $data);
        }
    }

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






$content .= '<br><br><br><p>Mise &aacute; jour effectu&eacute;e</p><a href="document_update.php">Retour</a>';


echo $snrArray[0][0];
/*
 * 0 -> emp_full_name
 * 1 -> continued_service
 * 2 -> full_name

 */
// input mask is 2008-7-04

foreach ($snrArray as $snr) {




}








?>


<?php
define('PREAMBLE', '../');
include ("../assets/php/code_blocks.php");

$content .=  "<!DOCTYPE HTML><html>";

block_print_document_header("Template", PREAMBLE);
$content .=  "<body class=\"is-preload\">";
$content .=  "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
//TODO: put logic to verify cookie and modify this
block_print_nav("<li><a href=\"".PREAMBLE."login.php\">Connexion</a></li>");

//put code in content
block_print_main($content);

block_print_copyright();
$content .=  "    </div>";
block_print_scripts(PREAMBLE);
$content .=  "	</body>";
$content .=  "</html>";
