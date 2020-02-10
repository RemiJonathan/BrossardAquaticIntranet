<?php
define('PREAMBLE', '');
include (PREAMBLE."assets/php/code_blocks.php");
include (PREAMBLE."db_operations/connection.php");

echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil",'');
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
session_start();
    block_print_header("class=\"alt\"", PREAMBLE);
    //TODO: put logic to verify cookie and modify this
    block_print_nav("");
    block_print_banner();

    block_print_copyright();
echo "    </div>";
block_print_scripts('');
echo "	</body>";
echo "</html>";