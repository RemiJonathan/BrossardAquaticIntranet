<?php
//UChNLJEjh23vrjWr

define('DB_HOST', 'localhost');
define('DB_USERNAME', 'regular_user');
define('DB_PASSWORD', 'UChNLJEjh23vrjWr');
define('DB_DATABASE', 'brossard_intranet');


$db = mysqli_connect(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($db->connect_error) {
    echo $my_env_var = getenv('DB_HOST') . getenv('DB_USERNAME') . getenv('DB_PASSWORD') . getenv('DB_DATABASE') . DB_USERNAME . DB_PASSWORD . DB_DATABASE;
    echo "Connection failed: $db->connect_error";
    exit;
}

