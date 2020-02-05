<?php
define('PREAMBLE', '../');

include(PREAMBLE . "db_operations/connection.php");


if(isset($_POST['shift']) && isset($_POST['user'])){
    /*echo '<code><pre>'.print_r($_POST['shift']).'</pre></code>';
    echo '<code><pre>'.print_r($_POST['user']).'</pre></code>';*/
    foreach ($_POST['shift'] as $key => $shift){
        //echo 'UPDATE shift SET assigned_user = \''.$shift.'\' WHERE shift_id = \''.$_POST['user'][$key].'\';';
        $db->query('UPDATE shift SET assigned_user = \''.$_POST['user'][$key].'\' WHERE shift_id = \''.$shift.'\';') or die ($db->error);

    }

    header('Location: index.php?saved=true');
}
?>