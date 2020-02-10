<?php
include ("db_operations/connection.php");
session_start();

if($_SERVER["REQUEST_METHOD"] == "POST") {

    // username and password sent from form

    $myusername = mysqli_real_escape_string($db,$_SESSION['user_id']);
    $mypassword = mysqli_real_escape_string($db,$_SESSION['password']);
    $
    $currentUrl = $_POST['currentUrl'];

    $sql = "SELECT user_id, passphrase FROM user WHERE user_id = '$myusername'";


    $result = mysqli_query($db,$sql);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    $active_user_id = $row['user_id'];
    $active_passphrase = $row['passphrase'];
    $count = mysqli_num_rows($result);

    if($count == 1) {
        if (password_verify($mypassword, $active_passphrase)) {
            $_SESSION['user_id'] = $myusername;
            $_SESSION['password'] = $mypassword;



            if (substr($currentUrl . "", -9) == 'login.php')
                header('Location: news_feed.php');

            else header('Location: ' . $currentUrl);
        }
    }
}