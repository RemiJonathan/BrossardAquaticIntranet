<?php
function insertNewRegUser($db, $id, $pwd, $fname, $lname){

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

function parseDate($rawDate){

    $rawDate = strtotime(str_replace('-', '-01-', $rawDate));

    $rawDate = getDate((int)$rawDate);

    $finalDate =  $rawDate['year'] . "-". $rawDate['mon'] . "-". $rawDate['mday'];

    return $finalDate;
}



