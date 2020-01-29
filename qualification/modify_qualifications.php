<?php
define('PREAMBLE', '../');
include(PREAMBLE . "db_operations/connection.php");

if (isset($_POST['save'])) {
    $save_user_id = $db->real_escape_string($_POST['save_user_id']);
    $save_qualification_id = $db->real_escape_string($_POST['save_qualification_id']);
    $save_qual_expiry = $db->real_escape_string($_POST['save_qual_expiry']);
    if(isset($_POST['save_qual_emitted']))$save_qual_emitted = "'".$db->real_escape_string($_POST['save_qual_emitted'])."'"; else $save_qual_emitted = 'NULL';
    if(!empty($_POST['save_requalification']))$save_requalification = "'".$db->real_escape_string($_POST['save_requalification'])."'"; else $save_requalification = 'NULL';
    if(isset($_POST['save_note']))$save_note = "'".$db->real_escape_string($_POST['save_note'])."'"; else $save_note = 'NULL';

    $db->query("INSERT INTO qualified_user (user_id, qualification_id, qual_emitted, qual_expiry, requalification_note, notes)
VALUES ('$save_user_id', '$save_qualification_id', $save_qual_emitted, '$save_qual_expiry', $save_requalification, $save_note)
ON DUPLICATE KEY UPDATE qual_emitted        = $save_qual_emitted,
                        qual_expiry         = '".$save_qual_expiry."',
                        requalification_note = ".$save_requalification.",
                        notes               = ".$save_note.";") or die($db->error);
}

header("Location: index.php?changed=true&selected_user=$save_user_id");