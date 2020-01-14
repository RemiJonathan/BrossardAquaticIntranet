<?php
define('PREAMBLE', '');
include (PREAMBLE."assets/php/code_blocks.php");
include (PREAMBLE."db_operations/connection.php");

echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil",'');
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();
if(isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    block_print_nav("<li><a href='logout.php'>D&eacute;connexion</a></li>");
    $content = "";
    $get_user_data_sql = "SELECT * FROM user WHERE user_id = '".$user_id."'";
    $get_user_data_res = $db->query($get_user_data_sql);


    $notifications = '<iframe src="file_operations/schedule_creation.php" width="100%" frameborder="0" scrolling="no" onload="resizeIframe(this)"></iframe>';
    $notifications .= '<iframe src="qualification" width="100%" frameborder="0" scrolling="no" onload="resizeIframe(this)"></iframe>';

    while ($user = $get_user_data_res->fetch_array()){
        //todo: implement user object
    $content .= block_print_welcome_header($user['user_fname'], $notifications);

    }
    block_print_main(($content));
}else{
    block_print_nav("<li><a href='login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>".$connection_form);
    session_destroy();
}
block_print_copyright();
echo "    </div>";
block_print_scripts('');
echo "<script>
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';
  }
</script>";
echo "	</body>";
echo "</html>";

