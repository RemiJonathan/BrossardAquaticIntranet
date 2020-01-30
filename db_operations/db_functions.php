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

function getQualArray($db){
    $qualArray = array();
    $result = $db->query("SELECT * FROM qualification");
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($qualArray,$row);
    }
    
    return $qualArray;
}

function insertNewRegUser($db, $id, $pwd, $fname, $lname){

    $fname = trim($fname);
    $lname = trim($lname);
   $stmt = $db -> prepare("INSERT INTO user (user_id, passphrase, user_fname, user_lname) VALUES (?,?,?,?)
");
    $stmt->bind_param("isss", $id, $pwd, $fname, $lname);

   $stmt->execute();

}
//insert into qualified_user values  ('800148','1',null,'2008-7-04','test1','test2');
function insertNewSNQual($db, $user_id,  $qual_expiry, $requalification, $requalification_note){
    $qualification_id="1";
    $qual_emitted=null;


    $stmt = $db -> prepare("INSERT INTO qualified_user (user_id, qualification_id, qual_emitted, qual_expiry,requalification_note, notes) VALUES (?,?,?,?,?,?)");


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



