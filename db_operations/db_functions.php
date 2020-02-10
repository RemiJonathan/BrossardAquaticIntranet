<?php
function getSessions($db){
    $sessionsArray = array();
    $result = $db->query("SELECT * FROM schedule");
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($sessionsArray,$row);
    }

    return $sessionsArray;
}

function getLocations($db){
    $locationsArray = array();
    $result = $db->query("SELECT location_name FROM location");
    while ($row = mysqli_fetch_assoc($result)) {
       array_push($locationsArray,$row["location_name"]);
    }

    return $locationsArray;
}


function deleteSession($db, $sch_id){

    $db->query("DELETE FROM schedule WHERE sch_id = $sch_id");

}

function updateSession($db, $sch_id, $sch_start_date, $sch_end_date, $title)
{

    $stmt = $db->prepare("UPDATE schedule SET  sch_start_date = ?, sch_end_date = ?,  title = ? WHERE sch_id = ? ");
    $stmt->bind_param("sssi", $sch_start_date, $sch_end_date, $title, $sch_id);

    $stmt->execute();

}

function getQualArray($db)
{
    $qualArray = array();
    $result = $db->query("SELECT * FROM qualification");
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($qualArray, $row);
    }

    return $qualArray;
}

function getQual($db, $qual_id)
{
    $current = "";

    $qualArray = getQualArray($db);
    foreach ($qualArray as $qual) {
        if ($qual['qualification_id'] == $qual_id) {
            $current = $qual;
        }
    }
    return $current;
}

function getUserQual($db, $user_id, $qual_id)
{
    $userQual = "";
    $result = $db->query("SELECT * FROM qualified_user WHERE user_id = $user_id AND qualification_id = $qual_id");
    $userQual = mysqli_fetch_assoc($result);

    return $userQual;
}

function getEmpNumsArray($db)
{
    $empArray = getEmpArray($db);
    $empNumArray = array();

    foreach ($empArray as $emp) {
        $empNumArray[] = $emp['user_id'];
    }

    return $empNumArray;
}


function getEmpArray($db)
{
    $empArray = array();
    $result = $db->query("SELECT * FROM user");
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($empArray, $row);
    }

    return $empArray;
}

function updateUser($db, $id, $pwd, $fname, $lname, $email)
{

    $fname = trim($fname);
    $lname = trim($lname);
    $email = trim($email);
    $stmt = $db->prepare("UPDATE user SET  passphrase = ?, user_fname = ?, user_lname = ?, email = ? WHERE user_id = ?");
    $stmt->bind_param("ssssi", $pwd, $fname, $lname, $email, $id);

    $stmt->execute();

}

function insertNewRegUser($db, $id, $pwd, $fname, $lname, $email)
{

    $fname = trim($fname);
    $lname = trim($lname);
    $email = trim($email);
    $stmt = $db->prepare("INSERT INTO user (user_id, passphrase, user_fname, user_lname, email) VALUES (?,?,?,?,?)
");
    $stmt->bind_param("issss", $id, $pwd, $fname, $lname, $email);

    $stmt->execute();

}

//insert into qualified_user values  ('800148','1',null,'2008-7-04','test1','test2');
function insertNewSNQual($db, $user_id, $qual_expiry, $requalification, $requalification_note)
{
    $qualification_id = "1";
    $qual_emitted = null;


    $stmt = $db->prepare("INSERT INTO qualified_user (user_id, qualification_id, qual_emitted, qual_expiry,requalification_note, notes) VALUES (?,?,?,?,?,?)");


    $stmt->bind_param("iissss", $user_id, $qualification_id, $qual_emitted, $qual_expiry, $requalification, $requalification_note);

    $stmt->execute();

}

function insertNewMSAQual($db, $user_id,  $qual_expiry, $requalification, $requalification_note){
    $qualification_id="2";
    $qual_emitted=null;


    $stmt = $db -> prepare("INSERT INTO qualified_user (user_id, qualification_id, qual_emitted, qual_expiry,requalification_note, notes) VALUES (?,?,?,?,?,?)");


    $stmt->bind_param("iissss", $user_id, $qualification_id, $qual_emitted, $qual_expiry, $requalification, $requalification_note);

    $stmt->execute();

}


function insertNewMSQual($db, $user_id, $qual_emitted, $qual_expiry, $requalification_note){
    $qualification_id="3";



    $stmt = $db -> prepare("INSERT INTO qualified_user (user_id, qualification_id, qual_emitted, qual_expiry,requalification_note) VALUES (?,?,?,?,?)");


    $stmt->bind_param("iisss", $user_id, $qualification_id, $qual_emitted, $qual_expiry, $requalification_note);

    $stmt->execute();

}

function insertNewMSUQual($db, $user_id, $qual_emitted, $qual_expiry, $requalification_note){
    $qualification_id="4";



    $stmt = $db -> prepare("INSERT INTO qualified_user (user_id, qualification_id, qual_emitted, qual_expiry,requalification_note) VALUES (?,?,?,?,?)");


    $stmt->bind_param("iisss", $user_id, $qualification_id, $qual_emitted, $qual_expiry, $requalification_note);

    $stmt->execute();

}

function insertNewMSNQual($db, $user_id, $qual_emitted, $qual_expiry, $requalification_note){
    $qualification_id="5";



    $stmt = $db -> prepare("INSERT INTO qualified_user (user_id, qualification_id, qual_emitted, qual_expiry,requalification_note) VALUES (?,?,?,?,?)");


    $stmt->bind_param("iisss", $user_id, $qualification_id, $qual_emitted, $qual_expiry, $requalification_note);

    $stmt->execute();

}

function insertNewISAQual($db, $user_id, $qual_emitted, $qual_expiry, $requalification_note){
    $qualification_id="6";



    $stmt = $db -> prepare("INSERT INTO qualified_user (user_id, qualification_id, qual_emitted, qual_expiry,requalification_note) VALUES (?,?,?,?,?)");


    $stmt->bind_param("iisss", $user_id, $qualification_id, $qual_emitted, $qual_expiry, $requalification_note);

    $stmt->execute();

}

function insertNewAQFQual($db, $user_id, $qual_emitted, $qual_expiry, $requalification_note){
    $qualification_id="7";



    $stmt = $db -> prepare("INSERT INTO qualified_user (user_id, qualification_id, qual_emitted, qual_expiry,requalification_note) VALUES (?,?,?,?,?)");


    $stmt->bind_param("iisss", $user_id, $qualification_id, $qual_emitted, $qual_expiry, $requalification_note);

    $stmt->execute();

}

function insertNewSurvSnr($db, $user_id, $hours, $continued_service){
    $seniority_type="surveillance";


    $stmt = $db -> prepare("INSERT INTO seniority (user_id, seniority_type, hours, continued_service) VALUES (?,?,?,?)
");


    $stmt->bind_param("isds", $user_id, $seniority_type, $hours, $continued_service);

    $stmt->execute();

}

function insertNewEnsSnr($db, $user_id, $hours, $continued_service){
    $seniority_type="enseignement";


    $stmt = $db -> prepare("INSERT INTO seniority (user_id, seniority_type, hours, continued_service) VALUES (?,?,?,?)
");


    $stmt->bind_param("isds", $user_id, $seniority_type, $hours, $continued_service);

    $stmt->execute();

}

function parseDate($rawDate){

    $rawDate = strtotime(str_replace('-', '-01-', $rawDate));

    $rawDate = getDate((int)$rawDate);

    $finalDate =  $rawDate['year'] . "-". $rawDate['mon'] . "-". $rawDate['mday'];

    return $finalDate;
}

function deleteExistingShifts($db, $schedule_id){

    if ($result = $db->query("SELECT * FROM shift WHERE schedule_id = $schedule_id")) {
        $rowAmt = $result->num_rows;
    }
        if ($rowAmt == 0){
            echo "not found";
        }
        else{
            $db->query("DELETE FROM shift WHERE schedule_id = $schedule_id");
            echo "found";
        }

        $result->close();

}

function deleteSurvList($db){

    $type = "surveillance";

    $query = $db->query("DELETE FROM seniority WHERE seniority_type = '$type';");

    if ($query) {
        echo "successful";
    } else {
        echo "not successful";
    }
}

function deleteEnsList($db)
{

    $type = "enseignement";
    $query = $db->query("DELETE FROM seniority WHERE seniority_type = '$type';");
    if ($query) {
        echo "successful";
    } else {
        echo "not successful";
    }
}

function insertNewShift($db, $schedule_id, $required_qual, $start_time, $end_time, $location, $day, $description, $start_date, $end_date){


    $stmt = $db -> prepare("INSERT INTO shift (schedule_id, required_qual, start_time, 
                   end_time, location, day, description, start_date, end_date) 
                   VALUES (?,?,?,?,?,?,?,?,?);");

    $stmt->bind_param("sssssssss", $schedule_id, $required_qual, $start_time, $end_time, $location, $day, $description, $start_date, $end_date);

    $stmt->execute();

}

function insertNewSchedule($db, $sch_start_date, $sch_end_date, $title)
{

    $stmt = $db->prepare("INSERT INTO schedule (sch_start_date, sch_end_date,  title) VALUES (?,?,?)
");
    $stmt->bind_param("sss", $sch_start_date, $sch_end_date, $title);

    $stmt->execute();

}

function insertAvailInstructions($db, $sch_id, $title, $deadline, $gen_info, $meet_info, $guidelines)
{
    $db->query("DELETE FROM availability_instructions WHERE sch_id = $sch_id");

    $stmt = $db->prepare("INSERT INTO availability_instructions (sch_id, title, deadline, gen_info, meet_info, guidelines) VALUES (?,?,?,?,?,?)");
    $stmt->bind_param("isssss", $sch_id, $title, $deadline, $gen_info, $meet_info, $guidelines);

    $stmt->execute();

}

function deleteAvailBlocks($db, $sch_id)
{
    $db->query("DELETE FROM availability_blocks WHERE sch_id = $sch_id");
}

function deleteSpecAvailBlocks($db, $sch_id)
{
    $db->query("DELETE FROM spec_availability_blocks WHERE sch_id = $sch_id");
}


function insertAvailBlocks($db, $sch_id, $day, $start_time, $end_time, $required_qual, $category)
{

    $stmt = $db->prepare("INSERT INTO availability_blocks (sch_id, day, start_time, end_time, required_qual, category) VALUES (?,?,?,?,?,?)");
    $stmt->bind_param("isssis", $sch_id, $day, $start_time, $end_time, $required_qual, $category);

    $stmt->execute();


}

function insertSpecAvailBlocks($db, $sch_id, $start_date, $end_date, $start_time, $end_time, $required_qual, $block_cat)
{

    $stmt = $db->prepare("INSERT INTO spec_availability_blocks (sch_id, start_date, end_date, start_time, end_time, required_qual, block_cat) VALUES (?,?,?,?,?,?,?)
");
    $stmt->bind_param("issssis", $sch_id, $start_date, $end_date, $start_time, $end_time, $required_qual, $block_cat);

    $stmt->execute();
}

function getAvailInstructions($db)
{
    $instrucArray = array();
    $result = $db->query("SELECT * FROM availability_instructions");
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($instrucArray, $row);
    }

    return $instrucArray;
}

function getUserAvailabilities($db, $user_id, $sch_id)
{
    $blocksArray = array();
    $result = $db->query("SELECT * FROM availabilities WHERE user_id = $user_id AND sch_id = $sch_id");
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($blocksArray, $row);
    }

    return $blocksArray;
}

function getSpecUserAvailabilities($db, $user_id, $sch_id)
{
    $blocksArray = array();
    $result = $db->query("SELECT * FROM spec_availabilities WHERE user_id = $user_id AND sch_id = $sch_id");
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($blocksArray, $row);
    }

    return $blocksArray;
}

function getAvailBlocks($db)
{
    $blocksArray = array();
    $result = $db->query("SELECT * FROM availability_blocks");
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($blocksArray, $row);
    }

    return $blocksArray;
}

function getAvailBlock($db, $block_id)
{
    $current = "";
    $blockArray = getAvailBlocks($db);
    foreach ($blockArray as $block) {
        if ($block_id == $block['block_id']) {
            $current = $block;
        }
    }
    return $current;
}


function getSpecAvailBlocks($db)
{
    $blocksArray = array();
    $result = $db->query("SELECT * FROM spec_availability_blocks");
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($blocksArray, $row);
    }

    return $blocksArray;
}

function getSpecAvailBlock($db, $block_id)
{
    $current = "";
    $blockArray = getSpecAvailBlocks($db);
    foreach ($blockArray as $block) {
        if ($block_id == $block['block_id']) {
            $current = $block;
        }
    }
    return $current;
}


function getSchedules($db)
{
    $scheduleArray = array();
    $result = $db->query("SELECT * FROM schedule");
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($scheduleArray, $row);
    }

    return $scheduleArray;
}

function getSchedule($db, $sch_id)
{
    $current = "";
    $scheduleArray = getSchedules($db);
    foreach ($scheduleArray as $schedule) {
        if ($sch_id == $schedule['sch_id']) {
            $current = $schedule;
        }
    }
    return $current;
}

function deleteUserSemAvails($db, $sch_id, $user_id)
{
    $db->query("DELETE FROM user_semester_avail WHERE sch_id = $sch_id AND user_id = $user_id");
}

function insertUserSemAvails($db, $user_id, $sch_id, $date_submitted, $avail_type, $comments, $max_hours)
{


    $stmt = $db->prepare("INSERT INTO user_semester_avail (user_id, sch_id, date_submitted, avail_type, comments, max_hours) VALUES (?,?,?,?,?,?)
");
    $stmt->bind_param("iisssi", $user_id, $sch_id, $date_submitted, $avail_type, $comments, $max_hours);

    $stmt->execute();
}

function deleteUserBlockAvails($db, $sch_id, $user_id)
{
    $db->query("DELETE FROM availabilities WHERE sch_id = $sch_id AND user_id = $user_id");
}

function insertUserBlockAvails($db, $block_id, $user_id, $sch_id)
{
    $stmt = $db->prepare("INSERT INTO availabilities (block_id, user_id, sch_id) VALUES (?,?,?)

");
    $stmt->bind_param("iii", $block_id, $user_id, $sch_id);

    $stmt->execute();
}

function deleteSpecUserBlockAvails($db, $sch_id, $user_id)
{
    $db->query("DELETE FROM spec_availabilities WHERE sch_id = $sch_id AND user_id = $user_id");
}

function insertSpecUserBlockAvails($db, $block_id, $user_id, $sch_id)
{
    $stmt = $db->prepare("INSERT INTO spec_availabilities (block_id, user_id, sch_id) VALUES (?,?,?)

");
    $stmt->bind_param("iii", $block_id, $user_id, $sch_id);

    $stmt->execute();
}



