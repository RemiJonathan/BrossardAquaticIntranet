<?php
define('PREAMBLE', '');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
session_start();
echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil", '');
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    block_print_nav("");
    $content = "";
    $get_user_data_sql = "SELECT * FROM user WHERE user_id = '" . $user_id . "'";
    $get_user_data_res = $db->query($get_user_data_sql);


    if (check_user_permissions($user_id, 2)) $notifications = '<form action=\'reset_all_passwords.php\'><input type=\'submit\' value=\'Envoyer un mot de passe temporaire par email &agrave; chaque utilisateur.\'></form>';

    while ($user = $get_user_data_res->fetch_array()) {
        //todo: implement user object
        $content .= block_print_welcome_header($user['user_fname'], '');

        $content .= '<div class="row">';

        $recent_article_sql = "SELECT * FROM article ORDER BY article_date LIMIT 10";
        $articles = $db->query($recent_article_sql);

        if ($articles->num_rows > 0) {

            while ($article = $articles->fetch_array()) {
                $id = $article['article_id'];
                $date = $article['article_date'];
                $title = $article['article_title'];
                $contents = $article['article_content'];
                $content .= "<div class=\"card bg-light col-12\" style=\"padding-left: 0;margin-bottom: 20px;\">
  <h5 class=\"card-header\">$title</h5>
  <div class=\"card-body\">
    <div class=\"card-title\"><em>$date</em></div>
    <p class=\"card-text\">$contents</p>
  </div>
</div>";
            }
        } else $content .= "<p>Aucun article n'est publi&eacute;.</p>";

        $content .= '</div>';
    }

    block_print_main(($content));
} else {
    block_print_nav("<li><a href='login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
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

