<?php define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");

session_start();

if (isset($_SESSION['user_id'])) {
    if (check_user_permissions($_SESSION['user_id'], 4)) {

        $user_id = $db->real_escape_string($_POST['user_id']);

        $recent_user_sql = "SELECT * FROM user WHERE user_id ='$user_id';";
        $users = $db->query($recent_user_sql);
        $user = $users->fetch_array();

        $user_fname = $user['user_fname'];
        $user_lname = $user['user_lname'];
        $email = $user['email'];
        $user_address = $user['user_address'];
        $role_id = $user['role_id'];
        $user_dob = $user['user_dob'];


        if (isset($_POST['passphrase'])){
            $mypassword = $db->real_escape_string($_POST['passphrase']);

            //Encrypt password
            $options = ['cost' => 10];
            $passphrase = password_hash($mypassword, PASSWORD_BCRYPT, $options);
        }
        if (isset($_POST['user_fname'])) $user_fname = $db->real_escape_string($_POST['user_fname']);
        if (isset($_POST['user_lname'])) $user_lname = $db->real_escape_string($_POST['user_lname']);
        if (isset($_POST['email'])) $email = $db->real_escape_string($_POST['email']);
        if (isset($_POST['user_address'])) $user_address = $db->real_escape_string($_POST['user_address']);
        if (isset($_POST['role_id'])) $role_id = $db->real_escape_string($_POST['role_id']);
        if (isset($_POST['user_dob'])) $user_dob = $db->real_escape_string($_POST['user_dob']);


        $update_record_sql = "INSERT INTO user (user_id, passphrase, user_fname, user_lname, email, user_address, role_id, user_dob)
VALUES ('$user_id', '$passphrase', '$user_fname', '$user_lname', '$email', '$user_address', '$role_id', '$user_dob')
ON DUPLICATE KEY UPDATE passphrase   = '$passphrase',
                        user_fname   = '$user_fname',
                        user_lname   = '$user_lname',
                        email        = '$email',
                        user_address = '$user_address',
                        role_id      = '$role_id',
                        user_dob     = '$user_dob';";
        //echo $update_record_sql;
        $db->query($update_record_sql) or die($db->error);

        header('Location: index.php?success=true');

    } else header('Location: index.php');
} else header('Location: index.php');

