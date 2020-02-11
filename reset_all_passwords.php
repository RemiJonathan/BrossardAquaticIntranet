<?php


define('PREAMBLE', '');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Mot de passe oubli&eacute;", '');
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";

echo "<section class=\"wrapper style2\" id=\"main\"><div class=\"inner\"><h3>Mot de passe oubli&eacute;</h3>";

$user_emails = $db->query("SELECT email FROM user WHERE user_id != '999999';");
while ($user_email = $user_emails->fetch_array()['email']) {
    if (!is_null($user_email)) {
        $mypassword = random_str("8");

        //Encrypt password
        $options = ['cost' => 10];

        $passwordhash = password_hash($mypassword, PASSWORD_BCRYPT, $options);
        //set password
        $db->query("UPDATE user SET passphrase = '$passwordhash' WHERE user_id ='" . $db->real_escape_string($_POST['user_id']) . "';");


        //Send temp password by email
        $to = "$user_email";
        $subject = "Nouveau Mot De Passe";

        $message = "
<html>
<head>
<title>Email de ILVO</title>
</head>
<body>
<h1>Mot de passe temporaire</h1>
<p>Votre nouveau mot de passe est <strong>$mypassword</strong> </p>

</body>
</html>
";

// Always set content-type when sending HTML email
        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

// More headers
        $headers .= 'From: ILVO Brossard <noreply@ilvo.ca>' . "\r\n";

        mail($to, $subject, $message, $headers) or die();

        echo "<h6>Le mot de passe a &eacute;t&eacute; envoy&eacute; &agrave; votre addresse : <em>$user_email</em><br />Assurez-vous de v&eacute;rifier vos courriers ind&eacute;sirables.</h6>";
    }
}
echo "</div></section>";
session_start();
block_print_header("", PREAMBLE);
//TODO: put logic to verify cookie and modify this
block_print_nav("");

block_print_copyright();
echo "    </div>";
block_print_scripts('');
echo "	</body>";
echo "</html>";

function random_str(
    $length,
    $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
)
{
    $str = '';
    $max = mb_strlen($keyspace, '8bit') - 1;
    if ($max < 1) {
        throw new Exception('$keyspace must be at least two characters long');
    }
    for ($i = 0; $i < $length; ++$i) {
        $str .= $keyspace[random_int(0, $max)];
    }
    return $str;
}