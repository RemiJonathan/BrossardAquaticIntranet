<?php define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");

session_start();

if (isset($_SESSION['user_id'])) {
    if (check_user_permissions($_SESSION['user_id'], 4) || check_user_permissions($_SESSION['user_id'], 3) || check_user_permissions($_SESSION['user_id'], 2)) {


        if (isset($_POST['article_id'])) $article_id = $_POST['article_id'];
        else  $article_id = null;
        $user_id = $_SESSION['user_id'];
        $article_title = $_POST['title'];
        $article_content = $_POST['content'];


        $update_record_sql = "INSERT INTO article (article_id, article_date, user_id, article_title, article_content)
VALUES ('$article_id', SYSDATE(), '$user_id', '$article_title', '$article_content')
ON DUPLICATE KEY UPDATE article_title   = '$article_title',
                        article_content = '$article_content';";
        //echo $update_record_sql;
        $db->query($update_record_sql) or die($db->error);

        header('Location: index.php?success=true');

    } else header('Location: index.php');
} else header('Location: index.php');

