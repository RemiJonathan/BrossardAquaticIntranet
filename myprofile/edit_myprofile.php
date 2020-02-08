<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    block_print_nav("");
    if (check_user_permissions($user_id, 1)){
        echo "<section class=\"wrapper style2\" id=\"main\"><div class=\"inner\">";


        echo '<form id="form1" name="form1" method="post" action="update_myprofile.php"><div class="row gtr-uniform">
<div class="col-6 col-12-small"><label for="passphrase">Passphrase</label><input type="text" name="passphrase" id="passphrase" /></div>
<div class="col-6 col-12-small"><label for="user_fname">User Fname</label><input type="text" name="user_fname" id="user_fname" /></div>
<div class="col-6 col-12-small"><label for="user_lname">User Lname</label><input type="text" name="user_lname" id="user_lname" /></div>
<div class="col-6 col-12-small"><label for="user_address">User Address</label><input type="text" name="user_address" id="user_address" /></div>
<div class="col-6 col-12-small"><label for="user_dob">User Dob</label><input type="text" name="user_dob" id="user_dob" /></div>
<div class="col-6 col-12-small"><label for="role_id">Role Id</label><input type="text" name="role_id" id="role_id" /></div>
<div class="col-6 col-12-small"><label for="user_start_date">User Start Date</label><input type="text" name="user_start_date" id="user_start_date" /></div>
</div></form>';
        echo "</div></section>";
    }
} else {
    block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
    session_destroy();
}
block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "	</body>";
echo "</html>";
