<?php
function insertNewRegUser($db, $id, $pwd, $fname, $lname){

   $stmt = $db -> prepare("INSERT INTO user (user_id, passphrase, user_fname, user_lname) VALUES (?,?,?,?)
");
    $stmt->bind_param("isss", $id, $pwd, $fname, $lname);

   $stmt->execute();
   echo "inserted";
}

