<?php
define('PREAMBLE', '');
include (PREAMBLE."assets/php/code_blocks.php");
include (PREAMBLE."db_operations/connection.php");
session_start();
echo "<!DOCTYPE HTML><html>";
block_print_document_header("Connexion", '');
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
//TODO: put logic to verify cookie and modify this
block_print_nav("");
$error_message = '';
if(isset($_GET['error'])) $error_message .= "<h4 style='color: #ff0060'>".$_GET['error']."</h4>";
block_print_main("".$connection_form."".$error_message);

block_print_copyright();
echo "    </div>";
block_print_scripts('');
echo "	</body>";
echo "</html>";