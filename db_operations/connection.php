<?php

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'regular_user');
define('DB_PASSWORD', 'codeBulle123');
define('DB_DATABASE', 'brossard_intranet');

$connection = @new mysqli(DB_SERVER,DB_USERNAME,DB_PASSWORD, DB_DATABASE);

if($connection->connect_error){
echo "Connection failed: $connection->connect_error";
exit;
}
