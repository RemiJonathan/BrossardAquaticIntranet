<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Mon Profil", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    block_print_nav("");
    if (check_user_permissions($user_id, 1)){
        $sql = "SELECT * FROM user WHERE user_id = '$user_id'";
        $user = $db->query($sql)->fetch_array(MYSQLI_ASSOC);
        echo "<section class=\"wrapper style2\" id=\"main\"><div class=\"inner\">";

        echo "<div class=\"row gtr-uniform\" style='font-size: small'>";

        if(isset($_GET['error'])) echo "<h3 style='color: rebeccapurple'>Une erreure s'est produite: ".$_GET['error']."</h3>";

        echo "<div class=\"col-12\"></span><div class=\"box\">";

        echo "<h4>Ma fiche Personnelle</h4>";
        echo "<table>";
        echo "<tr>";
        echo "<td>NIE: </td><td colspan='2'><span>".$user["user_id"]."</span></td><br />";
        echo "</tr>";
        echo "<tr>";
        echo "<td>Nom Complet: </td><td colspan='2'><span>".$user["user_fname"]." ".$user["user_lname"]."</span></td>";
        echo "</tr>";
        echo "<tr>";
        echo "<td>Courriel: </td><td><span>" . $user["email"] . "</span></td><td><form action='change_email.php' method='post'><ul class=\"actions\"><li><input id='email' type='email' name='email' style='display: none; font-size: xx-small' required></li><li><input class ='button' type='button' id='mail' value='Modifier'></li></ul></form></td>";
        echo "</tr>";
        echo "<tr>";
        echo "<td>Date de Naissance: </td><td colspan='2'><span>".$user["user_dob"]."</span></td>";
        echo "</tr>";
        echo "<tr>";
        echo "<td>Mot de Passe: </td><td><span>&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;</span></td><td><form action='change_password.php' method='post'><ul class=\"actions\"><li><input id='currentPassword' name='currentPassword' type='password' style='display: none' placeholder='Ancien mot de passe' required></li><li><input id='password' type='password' name='password' style='display: none' placeholder='Nouveau mot de passe' required></li><li><input id='passwordConf' type='password' style='display: none' placeholder='Nouveau mot de passe' required></li><li><input class ='button' type='button' id='pass' value='Modifier'></li></ul></form></td>";
        echo "</tr>";
        echo "</table>";

        echo "</div></div>";

        echo "</div>";

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
echo "<script>
$('.button').click(function() {
  let elementId = $(this).attr('id');
  
  switch (elementId) {
    case 'mail':
        $('#email').toggle('slide',function() {
            $('#'+elementId).val('sauvegarder');
        //$('#'+elementId).add('sauvegarder');
        $('#'+elementId).attr('id', 'saveEmail');
        $('#saveEmail').attr('type','submit');
        });
        
    break;
    
    case 'pass':
        $('#currentPassword').toggle('slide');
        $('#password').toggle('slide', function() {
            $('#'+elementId).val('sauvegarder');
        //$('#'+elementId).add('sauvegarder');
        $('#'+elementId).attr('id', 'changePass');
        $('#changePass').attr('type','submit');
        $('#changePass').prop('disabled', true);
        
        });
        $('#passwordConf').toggle('slide');
        
    break;
  }
});

$('#passwordConf').on('input',function(){
    let confirmationpass = $(this).val();
    console.log(confirmationpass);
    let newPass = $('#password').val();
    console.log(newPass);
    if (confirmationpass == newPass){
        console.log('passwords match');
        $('#changePass').prop('disabled', false);
    }else {
        console.log('passwords don\'t match');
        $('#changePass').prop('disabled', true);
    }
});

</script>";
echo "	</body>";
echo "</html>";
