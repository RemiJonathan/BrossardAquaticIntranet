<?php

$to = "contact@remijonathan.com, horiasandu1@gmail.com, elainegaorxu@gmail.com";
$subject = "HTML email";

$message = "
<html>
<head>
<title>TEST email from ILVO</title>
</head>
<body>
<h1>THIS IS A TEST EMAIL FROM ILVO ?</h1>
<p>This email contains HTML Tags!</p>
<table>
<tr>
<th>Firstname</th>
<th>Lastname</th>
</tr>
<tr>
<td>John</td>
<td>Doe</td>
</tr>
</table>
</body>
</html>
";

// Always set content-type when sending HTML email
$headers = "MIME-Version: 1.0" . "\r\n";
$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

// More headers
$headers .= 'From: ILVO Brossard <ilvo@remijonathan.com>' . "\r\n";

mail($to, $subject, $message, $headers) or die();

define('PREAMBLE', '');
include("assets/php/code_blocks.php");

echo "<!DOCTYPE HTML><html>";
block_print_document_header("Template", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
//TODO: put logic to verify cookie and modify this
block_print_nav("<li><a href=\"" . PREAMBLE . "login.php\">Connexion</a></li>");

//put code in content
block_print_main("Email Sent");

block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "	</body>";
echo "</html>";
