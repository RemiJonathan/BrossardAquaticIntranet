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


    $stmt = $db -> prepare("INSERT INTO qualified_user (user_id, qualification_id, qual_emitted, qual_expiry,requalification, notes) VALUES (?,?,?,?,?,?)");


    $stmt->bind_param("iissss", $user_id, $qualification_id, $qual_emitted, $qual_expiry, $requalification, $requalification_note);

    $stmt->execute();

    echo "success";

}

function parseDate($rawDate){

    $rawDate = strtotime(str_replace('-', '-01-', $rawDate));

    $rawDate = getDate((int)$rawDate);

    $finalDate =  $rawDate['year'] . "-". $rawDate['mon'] . "-". $rawDate['mday'];

    return $finalDate;
}



