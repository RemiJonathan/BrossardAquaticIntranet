

<?php
define("PREAMBLE","../");
include(PREAMBLE . "db_operations/connection.php");
//export.php
//if(isset($_POST["export"])){


header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment; filename=liste_surveillance.csv');
$output = fopen("liste_surveillance.csv", "w");
fputcsv($output, array('Rang', 'No. Employé', 'Nom', 'Service Continu', 'Heures'));
$query = "SELECT * from seniority ORDER BY hours DESC";
$result = mysqli_query($db, $query);
while($row = mysqli_fetch_assoc($result))
{

    fputcsv($output, $row);
}
fclose($output);
//}
?>