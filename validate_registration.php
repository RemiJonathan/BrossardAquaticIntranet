<?php
include ("assets/php/code_blocks.php");
include ("db_operations/connection.php");
session_start(['cookie_lifetime' => 6000]);

if($_SERVER["REQUEST_METHOD"] == "POST") {

    // username and password sent from form

    $myusername = mysqli_real_escape_string($db,$_POST['username']);
    $mypassword = mysqli_real_escape_string($db,$_POST['password']);

    //Encrypt password
    $options = ['cost' => 10];
    $passwordhash = password_hash($mypassword, PASSWORD_BCRYPT, $options);
    echo $passwordhash;

    $sql = "SELECT user_id FROM user WHERE user_id = '$myusername'";
    $result = mysqli_query($db,$sql);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    $active = $row['active'];
    $count = mysqli_num_rows($result);


    // If result matched $myusername and $mypassword, table row must be 1 row

    if($count == 0) {
        $_SESSION['login_user'] = $myusername;

        header("Location: news_feed.php");
    }else {
        $error = "Your Login Name or Password is invalid";
    }
}
