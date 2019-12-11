<?php

$mypassword = "password";

//Encrypt password
$options = ['cost' => 10];
$passwordhash = password_hash($mypassword, PASSWORD_BCRYPT, $options);

echo $passwordhash;
