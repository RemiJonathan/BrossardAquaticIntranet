<?php
include('../db_operations/connection.php');
include ('../db_operations/db_functions.php');

$filename = 'uploads/list_qual.csv';
$content ="";
// The nested array to hold all the arrays
$empArray = [];

// Open the file for reading
if (($h = fopen("{$filename}", "r")) !== FALSE)
{
    // Each line in the file is converted into an individual array that we call $data
    // The items of the array are comma separated
    while (($data = fgetcsv($h, 1000, ",")) !== FALSE) {
        // Each individual array is being pushed into the nested array

        if (current($data) != 0) {
            array_push($empArray, $data);
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



foreach ($empArray as $employee) {


     //   insertNewRegUser($db,utf8_encode($employee[0]),random_str(8),utf8_encode($employee[2]),utf8_encode($employee[1]));

   // $content .=  random_str(8)."<br>" .utf8_encode($employee['0'])."<br>".utf8_encode($employee['1'])."<br>".utf8_encode($employee['2'])."<br>";


}


$content .= '<br><br><br><p>Mise &aacute; jour effectu&eacute;e</p><a href="document_update.php">Retour</a>';



/*
 * 0 -> emp num
 * 1 -> lname
 * 2 -> fname
 *
 * 3 -> sn_exp
 * 4 -> sn_requal
 * 5 -> sn_NOTes
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
$horiaArray = $empArray[81];
$testStr = $horiaArray[3];
$testStr = str_replace('-', '-01-', $testStr);
print_r();
echo $testStr;


$t = strtotime("Jan 1, 1970");
$time_input = strtotime("Dec-21");
//$time_input = str_replace('-', '-01-', $time_input);

$date_input = getDate($time_input);
print_r($date_input);

if ($horiaArray[3]!=null){
$content.=  "SN FOUND <BR>";
}
else{
    $content.=  "SN NOT FOUND <BR>";
}

if ($horiaArray[6]!=null){
    $content.=  "MSA FOUND <BR>";
}
else{
    $content.=  "MSA NOT FOUND <BR>   ";
}

if ($horiaArray[9]!=null){
    $content.=  "MS FOUND <BR>";
}
else{
    $content.=  "MS NOT FOUND <BR>   ";
}

if ($horiaArray[12]!=null){
    $content.=  "MSU FOUND <BR>";
}
else{
    $content.=  "MSU NOT FOUND <BR>   ";
}

if ($horiaArray[15]!=null){
    $content.=  "MSN FOUND <BR>";
}
else{
    $content.=  "MSN NOT FOUND <BR>   ";
}

if ($horiaArray[18]!=null){
    $content.=  "ISA FOUND <BR>";
}
else{
    $content.=  "ISA NOT FOUND <BR>   ";
}

if ($horiaArray[21]!=null){
    $content.=  "AQF FOUND <BR>";
}
else{
    $content.=  "AQF NOT FOUND <BR>   ";
}




/*
foreach ($empArray[81] as $item) {
    $content.=  $item;
}
*/

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
