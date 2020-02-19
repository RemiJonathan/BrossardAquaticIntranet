<?php define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");

session_start();

if (isset($_SESSION['user_id'])) {
    if (check_user_permissions($_SESSION['user_id'], 3) || check_user_permissions($_SESSION['user_id'], 2)) {

        if (isset($_GET['article_id'])) {
            $article_id = $db->real_escape_string($_GET['article_id']);

            $delete_article_sql = "DELETE FROM article WHERE article_id = '$article_id';";
            $db->query($delete_article_sql) or die($db->error);

            header("Location: index.php?success=true&article=$article_id");
        }

        header('Location: index.php?success=true');

    } else header('Location: index.php');
} else header('Location: index.php');

