<?php
include('../db_operations/connection.php');


$filename = 'uploads/list_emp.csv';

// The nested array to hold all the arrays
$empArray = [];

// Open the file for reading
if (($h = fopen("{$filename}", "r")) !== FALSE)
{
    // Each line in the file is converted into an individual array that we call $data
    // The items of the array are comma separated
    while (($data = fgetcsv($h, 1000, ",")) !== FALSE)
    {
        // Each individual array is being pushed into the nested array


        array_push($empArray,$data);
    }

    // Close the file
    fclose($h);
}

// Display the code in a readable format
echo "<pre>";
var_dump($empArray[0]);
echo "</pre>";





?>