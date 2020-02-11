<?php

define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");

//INSERT INTO shift (required_qual, start_time, end_time, day, description, start_date, end_date)
if (isset($_POST)) {
    $sch_id="";
    session_start();
    //$ = $_POST[''];
    if (isset ($_SESSION['current_session_schedule'])){
        $sch_id = $_SESSION['current_session_schedule'];
    }

    $required_qual = $db->real_escape_string($_POST['required_qual']);
    $start_time = $db->real_escape_string($_POST['start_time']);
    $end_time = $db->real_escape_string($_POST['end_time']);
    $day = $db->real_escape_string($_POST['weekday']);
    $start_date = $db->real_escape_string($_POST['start_date']);
    $end_date = $db->real_escape_string($_POST['end_date']);
    $location = $db->real_escape_string($_POST['location']);

    if (isset($_POST['description'])) {
        $description = $db->real_escape_string($_POST['description']);
        $insert_shift_sql = "INSERT INTO shift (schedule_id, required_qual, start_time, end_time, location, day, description, start_date, end_date) VALUES ('$sch_id', '$required_qual','$start_time','$end_time', '$location', '$day','$description','$start_date','$end_date')";
    } else {
        $insert_shift_sql = "INSERT INTO shift (schedule_id, required_qual, start_time, end_time, location, day, start_date, end_date) VALUES  ('$sch_id', '$required_qual','$start_time','$end_time', '$location', '$day','$start_date','$end_date')";
    }

    $db->query($insert_shift_sql) or die('Query Error: '.$db->error.'');

    header("Location: ../shift/?shift_created=true");
}