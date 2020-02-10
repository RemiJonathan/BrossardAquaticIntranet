<?php
define("PREAMBLE", "../");
include(PREAMBLE . "db_operations/connection.php");

include(PREAMBLE . "assets/php/code_blocks.php");

echo "<script>

window.onload = function() {
    //$('#userForm').hide();
    $('#qualForm').hide();
    $('#survForm').hide();
    $('#ensForm').hide();    
    
   // $('#updateUser').hide();
    $('#updateQual').hide();
    $('#updateSurv').hide();
    $('#updateEns').hide();
    
$(\"#userButton\").click(function() {
    $('#qualForm').hide('slow');
    $('#survForm').hide('slow');
    $('#ensForm').hide('slow'); 
    
    $('#userForm').show('slow');
    
    $('#updateQual').hide('slow');
    $('#updateSurv').hide('slow');
    $('#updateEns').hide('slow');
    
    $('#updateUser').show('slow');
});

$(\"#qualButton\").click(function() {
    $('#userForm').hide('slow');
    $('#survForm').hide('slow');
    $('#ensForm').hide('slow'); 
    
    $('#qualForm').show('slow');
    
    $('#updateUser').hide('slow');
    $('#updateSurv').hide('slow');
    $('#updateEns').hide('slow');
    
    $('#updateQual').show('slow');
});


$(\"#survButton\").click(function() {
    $('#userForm').hide('slow');
    $('#qualForm').hide('slow');
    $('#ensForm').hide('slow'); 
    
    $('#survForm').show('slow');
    
    $('#updateUser').hide('slow');
    $('#updateQual').hide('slow');
    $('#updateEns').hide('slow');
    
    $('#updateSurv').show('slow');
});

$(\"#ensButton\").click(function() {
    $('#userForm').hide('slow');
    $('#qualForm').hide('slow');
    $('#survForm').hide('slow'); 
    
    $('#ensForm').show('slow');
    
    $('#updateUser').hide('slow');
    $('#updateQual').hide('slow');
    $('#updateSurv').hide('slow');
    
    $('#updateEns').show('slow');
});


}

     

</script>";
$nav = "<div class=\"btn-group\" role=\"group\" aria-label=\"Basic example\">
  <button id='userButton' autofocus type=\"button\" class=\"btn btn-secondary\">Employ&eacute;s</button>
  <button id='qualButton' type=\"button\" class=\"btn btn-secondary\">Qualifications</button>
  <button id='survButton' type=\"button\" class=\"btn btn-secondary\">Anciennet&eacute; Surveillance</button>
  <button id='ensButton' type=\"button\" class=\"btn btn-secondary\">Anciennet&eacute; Enseignement</button>
</div><br><br>";
//TODO add veritification to check if the uploaded CSV file is actually the intended CSV
$form_data_emp_list = "<form action=\"uploadEmployeeList.php\" id='userForm' method=\"post\" enctype=\"multipart/form-data\">
    <h2>S&eacute;lectionner fichier CSV contenant la liste d'employ&eacute;s.</h2>
    
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form><br>";

$form_data_qual_list = "<form action=\"uploadQualList.php\" id='qualForm' method=\"post\" enctype=\"multipart/form-data\">

   
    <h2>S&eacute;lectionner fichier CSV contenant la liste de qualifications des employ&eacute;s.</h2>
    
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form>";

$form_data_surv_snr_list = "<form action=\"uploadSurvSnrList.php\" id='survForm' method=\"post\" enctype=\"multipart/form-data\">

  
    <h2>S&eacute;lectionner le fichier CSV contenant l'anciennet&eacute; de surveillance</h2>
    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form>";

$form_data_ens_snr_list = "

<form action=\"uploadEnsSnrList.php\" id='ensForm' method=\"post\" enctype=\"multipart/form-data\">
     
         <h2>S&eacute;lectionner le fichier CSV contenant l'anciennet&eacute; d'enseignement</h2>

    <input type=\"file\" name=\"fileToUpload\" id=\"fileToUpload\">
    <br><br>
    <input type='hidden' name='form' value='ens'>
    <input type=\"submit\" value=\"Charger\" name=\"submit\">
</form>

<br>
 ";


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Template",PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("","../");

session_start();
if(isset($_SESSION['user_id'])) {
    block_print_nav("");
    //TODO VALIDATE USER ACCESS
    block_print_main($nav . $form_data_emp_list . $form_data_qual_list . $form_data_surv_snr_list
        . $form_data_ens_snr_list);
}else{
    block_print_nav("<li><a href='".PREAMBLE."login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>".$connection_form);
    session_destroy();
}
//put code in content



block_print_copyright();
echo "    </div>";
block_print_scripts("../");
echo "	</body>";
echo "</html>";


?>