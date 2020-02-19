<?php
define("PREAMBLE", "../");

session_start();
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");

include('../db_operations/db_functions.php');


//TODO add veritification to check if the uploaded CSV file is actually the intended CSV

$content = "<h4 align='center' '>Enseignement</h4>
											<div class=\"table-wrapper\">
												<table class=\"alt\" id='ensTable'>
													<thead>
														<tr>
														    <th>Rang</th>
															<th>No. Employ&eacute;</th>
															<th>Nom</th>
															<th>Service Continu</th>
															<th>Heures</th>
														</tr>
													</thead>
													<tbody>";
$rankCounter = 1;
$snrArray = array();
$snr_res = $db->query("SELECT DISTINCT s.user_id, u.user_fname, u.user_lname, s.continued_service,
       s.hours FROM seniority s inner join user u on s.user_id = u.user_id WHERE s.seniority_type = 'enseignement' ORDER BY s.hours desc;") or die($db->error);
while ($snr = $snr_res->fetch_array()) {
    $content .= "<tr>
                    <td>" . $rankCounter . "</td>
                    <td>" . $snr["user_id"] . "</td>
                    <td>" . $snr["user_fname"] . " " . $snr["user_lname"] . "</td>
                    <td>" . $snr["continued_service"] . "</td>
                    <td>" . $snr["hours"] . "</td>
                    </tr>";
    $rankCounter++;
    //$content.=$snr["user_lname"]."<br>";
    //var_dump($snr);
}


$content .= "													</tbody>
													<tfoot>
													
													</tfoot>
												</table>
											</div>";
echo "<!DOCTYPE HTML><html>";
block_print_document_header("Enseignement", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", "../");
//TODO: put logic to verify cookie and modify this
block_print_nav("");
//put code in content
block_print_main($content);

block_print_copyright();
echo "    </div>";
block_print_scripts("../");

echo "	</body>";
echo "</html>";


?>