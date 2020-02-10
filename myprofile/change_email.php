<?php
define('PREAMBLE', '../');
include (PREAMBLE."db_operations/connection.php");
session_start();

if($_SERVER["REQUEST_METHOD"] == "POST") {

    // username and password sent from form

    $myusername = mysqli_real_escape_string($db,$_SESSION['user_id']);
    $mypassword = mysqli_real_escape_string($db,$_SESSION['password']);



    $sql = "SELECT user_id, passphrase FROM user WHERE user_id = '$myusername'";


    $result = mysqli_query($db,$sql);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    $active_user_id = $row['user_id'];
    $active_passphrase = $row['passphrase'];
    $count = mysqli_num_rows($result);

    if($count == 1) {
        if (password_verify($mypassword, $active_passphrase)) {

            $email = mysqli_real_escape_string($db, $_POST['email']);
            $db->query("UPDATE user SET email = '$email' WHERE user_id = '$myusername';");



            header('Location: index.php');
        }
    }
}