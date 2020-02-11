<?php
define('PREAMBLE', '../');
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");

if (isset($_POST['save'])) {
    $save_user_id = $db->real_escape_string($_POST['save_user_id']);
    $save_qualification_id = $db->real_escape_string($_POST['save_qualification_id']);
    $save_qual_expiry = $db->real_escape_string($_POST['save_qual_expiry']);
    if (isset($_POST['save_qual_emitted'])) $save_qual_emitted = "'" . $db->real_escape_string($_POST['save_qual_emitted']) . "'"; else $save_qual_emitted = 'NULL';
    if (!empty($_POST['save_requalification'])) $save_requalification = "'" . $db->real_escape_string($_POST['save_requalification']) . "'"; else $save_requalification = 'NULL';
    if (isset($_POST['save_note'])) $save_note = "'" . $db->real_escape_string($_POST['save_note']) . "'"; else $save_note = 'NULL';

    $db->query("INSERT INTO qualified_user (user_id, qualification_id, qual_emitted, qual_expiry, requalification_note, notes)
VALUES ('$save_user_id', '$save_qualification_id', $save_qual_emitted, '$save_qual_expiry', $save_requalification, $save_note)
ON DUPLICATE KEY UPDATE qual_emitted        = $save_qual_emitted,
                        qual_expiry         = '" . $save_qual_expiry . "',
                        requalification_note = " . $save_requalification . ",
                        notes               = " . $save_note . ";") or die($db->error);

    if ($save_qualification_id == '1' or $save_qualification_id == '2') {
        if (getUserQual($db, $save_user_id, '1') != null && getUserQual($db, $save_user_id, '2') != null) {
            $snQual = getUserQual($db, $save_user_id, '1');
            $msaQual = getUserQual($db, $save_user_id, '2');


            $earliestExpiry = "";


            if ($snQual['qual_expiry'] < $msaQual ['qual_expiry']) {
                $earliestExpiry = $snQual['qual_expiry'];
            } else {
                $earliestExpiry = $msaQual['qual_expiry'];
            }

            $db->query("INSERT INTO qualified_user (user_id, qualification_id,  qual_expiry)
VALUES ('$save_user_id', '8', '$earliestExpiry')
ON DUPLICATE KEY UPDATE 
                        qual_expiry         = '" . $earliestExpiry . "';") or die($db->error);
        }
    }

    if ($save_qualification_id == '1' or $save_qualification_id == '7') {
        if (getUserQual($db, $save_user_id, '1') != null && getUserQual($db, $save_user_id, '7') != null) {
            $snQual = getUserQual($db, $save_user_id, '1');
            $aqfQual = getUserQual($db, $save_user_id, '7');


            $earliestExpiry = $snQual['qual_expiry'];
            $earliestEmitted="";

            if ($snQual['qual_emitted'] < $aqfQual ['qual_emittes']) {
                $earliestEmitted = $snQual['qual_emitted'];
            } else {
                $earliestEmitted = $aqfQual['qual_emitted'];
            }

            $db->query("INSERT INTO qualified_user (user_id, qualification_id,  qual_expiry)
VALUES ('$save_user_id', '9', '$earliestExpiry')
ON DUPLICATE KEY UPDATE 
                        qual_expiry         = '" . $earliestExpiry . "';") or die($db->error);
        }
    }


}

header("Location: index.php?changed=true&selected_user=$save_user_id");