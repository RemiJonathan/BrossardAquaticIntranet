<?php
define("PREAMBLE","../");
include (PREAMBLE."db_operations/connection.php");
include (PREAMBLE."db_operations/db_functions.php");
include (PREAMBLE."assets/php/code_blocks.php");


$userArray = array();
$user_res = $db->query("SELECT user_id, user_lname, user_fname FROM user") or die($db->error);
while ($user = $user_res->fetch_array()) {
    $userArray[] = array("id" => $user["user_id"], "fname" => $user["user_fname"], "lname" => $user["user_lname"]);
//echo $user["user_id"].$user["user_fname"] . $user["user_lname"]."  <br>";
}



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

                array_push($snrArray, $data);

    }
    array_shift($snrArray);
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
 * 0 -> lname
 * 1 -> fname
 * 2 -> continued_service
 * 3 -> hours

 */
// input mask is 2008-07-20
/*
$test1 = $snrArray[5][0];
$test1 = str_replace("\"","",$test1);

$test2 = $snrArray[5][1];
$test2 = ltrim(str_replace("\"","",$test2));
*/






$content.="<br>";
deleteSurvList($db);
foreach ($snrArray as $snr) {

    $nameArray = explode(", ",$snr[0]);
    $lname =trim($nameArray[0]);
    $fname =trim($nameArray[1]);

    foreach($userArray as $user){
        if($user["lname"]==$lname && $user["fname"]==$fname){
            //echo $user["id"]."<br>";

            $origDate = $snr[1];
            $origDate = explode("/",$origDate);
            $finalDate = $origDate[2]."-".$origDate[0]."-".$origDate[1];


            insertNewSurvSnr($db,$user["id"],$snr[2],$finalDate);
        }
    }
}








?>


<?php



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
