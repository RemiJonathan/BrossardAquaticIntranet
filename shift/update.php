<?php

define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");

//INSERT INTO shift (required_qual, start_time, end_time, day, description, start_date, end_date)
if (isset($_POST)) {
    //$ = $_POST[''];
    $required_qual = $db->real_escape_string($_POST['required_qual']);
    $start_time = $db->real_escape_string($_POST['start_time']);
    $end_time = $db->real_escape_string($_POST['end_time']);
    $day = $db->real_escape_string($_POST['weekday']);
    $start_date = $db->real_escape_string($_POST['start_date']);
    $end_date = $db->real_escape_string($_POST['end_date']);
    $shift_id = $db->real_escape_string($_POST['shift_id']);

        $description = $db->real_escape_string($_POST['description']);

        $insert_shift_sql = "UPDATE shift SET required_qual = '$required_qual', start_time = '$start_time', end_time = '$end_time', day = '$day', description = '$description', start_date = '$start_date', end_date = '$end_date' WHERE shift_id = '$shift_id'";


    $db->query($insert_shift_sql) or die('Query Error: '.$db->error.'');

    header("Location: ../shift/?shift_updated=true");
}