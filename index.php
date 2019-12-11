<?php
include ("assets/php/code_blocks.php");

echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil",'');
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
    block_print_header("class=\"alt\"");
    //TODO: put logic to verify cookie and modify this
    block_print_nav("<li><a href=\"login.php\">Connexion</a></li>");
    block_print_banner();

    block_print_copyright();
echo "    </div>";
block_print_scripts('');
echo "	</body>";
echo "</html>";