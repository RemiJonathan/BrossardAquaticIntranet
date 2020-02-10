<?php
define('PREAMBLE', '../');
include(PREAMBLE . "db_operations/connection.php");
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // username and password sent from form

    $myusername = mysqli_real_escape_string($db, $_SESSION['user_id']);
    $mypassword = mysqli_real_escape_string($db, $_POST['currentPassword']);

    //echo $myusername;
    //echo $mypassword;

    $sql = "SELECT user_id, passphrase FROM user WHERE user_id = '$myusername'";

    $result = mysqli_query($db, $sql);
    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
    $active_user_id = $row['user_id'];
    $active_passphrase = $row['passphrase'];

    //echo $active_user_id;
    //echo $active_passphrase;

    $count = mysqli_num_rows($result);

    if ($count == 1) {
        if (password_verify($mypassword, $active_passphrase)) {

            $newPassword = mysqli_real_escape_string($db, $_POST['password']);

            $options = ['cost' => 10];
            $passwordhash = password_hash($newPassword, PASSWORD_BCRYPT, $options);

            $db->query("UPDATE user SET passphrase = '$passwordhash' WHERE user_id = '$myusername';");

            header('Location: index.php');
        } else header('Location: index.php?error=mot de passe invalide');
    } else header('Location: index.php?error=count not 0');
}