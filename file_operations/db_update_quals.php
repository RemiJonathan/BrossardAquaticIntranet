<?php
define("PREAMBLE","../");
include (PREAMBLE."assets/php/code_blocks.php");
include (PREAMBLE."db_operations/connection.php");
include (PREAMBLE."db_operations/db_functions.php");

$filename = 'uploads/list_qual.csv';
$content ="";
$message="Fichier manquant, veuillez le charger avant de tenter de mettre a jour la base de donnees";
if(!(file_exists($filename))){
    $content .= "<SCRIPT type='text/javascript'> 
        alert('$message');
        window.location.replace('document_update.php');
    </SCRIPT>";
}
// The nested array to hold all the arrays
$qualArray = [];

// Open the file for reading
if (($h = fopen("{$filename}", "r")) !== FALSE)
{
    $data = fgetcsv($h, 1000, ",");
    $message = $data[4];
    if (strtolower($data[4]) != "requalification" || strtolower($data[5]) != "note") {

        header("location:document_update.php?message=$message");
        exit;
    } else {
        array_push($qualArray, $data);
    }
    // Each line in the file is converted into an individual array that we call $data
    // The items of the array are comma separated
    while (($data = fgetcsv($h, 1000, ",")) !== FALSE) {
        // Each individual array is being pushed into the nested array

        if (current($data) != 0) {
            array_push($qualArray, $data);
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



/*
 * 0 -> emp num
 * 1 -> lname
 * 2 -> fname
 *
 * 3 -> sn_exp
 * 4 -> sn_requal
 * 5 -> sn_notes
 *
 * 6 -> msa_exp
 * 7 -> msa_requal
 * 8 -> msa_NOTes
 *
 * 9 -> ms_em
 * 10 -> ms_exp
 * 11 -> ms_requal
 *
 * 12 -> msu_em
 * 13 -> msu_exp
 * 14 -> msu_requal
 *
 * 15 -> msn_em
 * 16 -> msn_exp
 * 17 -> msn_requal
 *
 * 18 -> isa_em
 * 19 -> isa_exp
 * 20 -> isa_requal
 *
 * 21 -> aqf_em
 * 22 -> aqf_exp
 * 23 -> aqf_requal
 *
 *
 *
 */
// input mask is 2008-7-04

foreach ($qualArray as $qual) {

    if ($qual[3]!=null){
        insertNewSNQual($db,$qual[0],parseDate($qual[3]),$qual[4],$qual[5]);
    }
    else{
        //$content.=  "SN NOT FOUND <BR>";
    }

    if ($qual[6]!=null){
        insertNewMSAQual($db,$qual[0],parseDate($qual[6]),$qual[7],$qual[8]);
    }
    else{
        //$content.=  "MSA NOT FOUND <BR>   ";
    }

    if ($qual[9]!=null){
        insertNewMSQual($db,$qual[0],parseDate($qual[9]),parseDate($qual[10]),$qual[11]);
    }
    else{
        //$content.=  "MS NOT FOUND <BR>   ";
    }

    if ($qual[12]!=null){
        insertNewMSUQual($db,$qual[0],parseDate($qual[12]),parseDate($qual[13]),$qual[14]);

    }
    else{
        //$content.=  "MSU NOT FOUND <BR>   ";
    }

    if ($qual[15]!=null){
        insertNewMSNQual($db,$qual[0],parseDate($qual[15]),parseDate($qual[16]),$qual[17]);

    }
    else{
        //$content.=  "MSN NOT FOUND <BR>   ";
    }

    if ($qual[18]!=null){
        insertNewISAQual($db,$qual[0],parseDate($qual[18]),parseDate($qual[19]),$qual[20]);

    }
    else{
        //$content.=  "ISA NOT FOUND <BR>   ";
    }

    if ($qual[21]!=null){
        insertNewAQFQual($db,$qual[0],parseDate($qual[21]),parseDate($qual[22]),$qual[23]);

    }
    else{
        //$content.=  "AQF NOT FOUND <BR>   ";
    }


}
/*
$qual = $qualArray[81];
$rawDate = $qual[3];


$date1 = parseDate($qual[9]);
$date2 = parseDate($qual[10]);

//
insertNewMSUQual($db,$qual[0],$date1,$date2,"requalification soon");
insertNewMSNQual($db,$qual[0],$date1,$date2,"requalification soon");
insertNewISAQual($db,$qual[0],$date1,$date2,"requalification soon");
insertNewAQFQual($db,$qual[0],$date1,$date2,"requalification soon");

*/




unlink($filename);


?>


<?php


$content .=  "<!DOCTYPE HTML><html>";

block_print_document_header("Base de Donn&eacute;s", PREAMBLE);
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
