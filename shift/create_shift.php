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

    if (isset($_POST['description'])) {
        $description = $db->real_escape_string($_POST['description']);
        $insert_shift_sql = "INSERT INTO shift (required_qual, start_time, end_time, day, description, start_date, end_date) VALUES ('$required_qual','$start_time','$end_time','$day','$description','$start_date','$end_date')";
    } else {
        $insert_shift_sql = "INSERT INTO shift (required_qual, start_time, end_time, day, start_date, end_date) VALUES  ('$required_qual','$start_time','$end_time','$day','$start_date','$end_date')";
    }

    $db->query($insert_shift_sql);

    header("Location: ../shift/?shift_created=true");
}