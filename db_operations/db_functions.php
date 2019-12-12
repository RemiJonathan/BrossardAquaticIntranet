<?php
function insertNewRegUser($db, $id, $pwd, $fname, $lname){

   $stmt = $db -> prepare("INSERT INTO user (user_id, passphrase, user_fname, user_lname) VALUES (?,?,?,?)
");
    $stmt->bind_param("isss", $id, $pwd, $fname, $lname);

   $stmt->execute();

}

function insertNewSNQual($db, $user_id, $qualification_id, $qual_expiry, $requalification_note){

    $conv_qual_expiry =

    $stmt = $db -> prepare("INSERT INTO qualified_user (user_id, qualification_id, qual_expiry, requalification_note) VALUES (?,?,?,?)");


    $stmt->bind_param("isss", $user_id, $qualification_id, $conv_qual_expiry, $requalification_note);

    $stmt->execute();

}




