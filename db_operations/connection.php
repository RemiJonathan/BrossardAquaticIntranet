<?php
//UChNLJEjh23vrjWr

define('DB_SERVER', 'localhost');
/*
define('DB_USERNAME', 'regular_user');
define('DB_PASSWORD', 'UChNLJEjh23vrjWr');
define('DB_DATABASE', 'brossard_intranet');
*/


$db = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

if ($db->connect_error) {
    echo "Connection failed: $db->connect_error";
    exit;
}
