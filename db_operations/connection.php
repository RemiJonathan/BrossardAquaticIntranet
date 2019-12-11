<?php

$connection = @new mysqli('localhost','regular_user','codeBulle123', 'brossard_intranet');

if($connection->connect_error){
echo "Connection failed: $connection->connect_error";
exit;
}



?>