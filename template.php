<?php
include ("assets/php/code_blocks.php");

echo "<!DOCTYPE HTML><html>";
block_print_document_header("Template");
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("");
//TODO: put logic to verify cookie and modify this
block_print_nav("<li><a href=\"login.php\">Connexion</a></li>");
//put code in content
block_print_main("");

block_print_copyright();
echo "    </div>";
block_print_scripts();
echo "	</body>";
echo "</html>";