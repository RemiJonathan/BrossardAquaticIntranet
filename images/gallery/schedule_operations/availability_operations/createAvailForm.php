<?php
define("PREAMBLE", "../../");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");

include(PREAMBLE . "assets/php/code_blocks.php");

$sessionsArray = getSessions($db);
$form_data_schedule = "";
$content = "";
$content .= "<script type='text/javascript'>


window.onload = function() {
    $('#summer_avail_form').hide();
$( \"#summerButton\" ).click(function() {
if($('#reg_avail_form').is(':visible')){
    $('#reg_avail_form').hide('slow');
    $('#summer_avail_form').show('slow');
}else{
    $('#summer_avail_form').hide('slow');
    $('#reg_avail_form').show('slow');
}
});
}



 
</script>";

$message = "Erreur: Veuillez acceder a cette page depuis la section \"Sessions\"";
if (!(isset($_GET["sch_id"]))) {

    $schedule .= "<SCRIPT type='text/javascript'> 
        alert('$message');
        window.location.replace('../schedule_modification.php');
    </SCRIPT>";
}
$content .= "<h2>Formulaire de disponibilit&eacute;s</h2><button id='summerButton' onclick=\"summerForm()\">Reg/&Eacute;t&eacute;</button><br><br>";
//TODO add option to create new semester and add files to it
$form_data_schedule .= "<form action=\"create_form_info.php\" id=\"reg_avail_form\" method=\"get\" enctype=\"multipart/form-data\">
    <h2>R&eacute;gulier</h2>
    <h5>Titre de l'horaire:</h5> <input placeholder='Disponibilit&eacute;s  (Saison) 20XX' type='text' name='title'><br>
    <h5>Date limite:</h5> <input type='date' name='deadline'><br><br>
    <h5>Information G&eacute;n&eacute;rales </h5>
    <textarea  name='gen_info'>Les cours de natation se d&eacute;rouleront du 6 janvier au 15 mars 2020 (10 sem.). Rel&acirc;che &agrave; LT SEUL. le 1er-2-3 f&eacute;vrier (reprise les 16-21-22 mars)
    
    Les cours de mise en forme se d&eacute;rouleront du 6 janvier au 19 mars (11 sem.). 
    
    Les bains libres se d&eacute;rouleront du dimanche 5 janvier au vendredi 3 avril.</textarea><br>
    <h5>R&eacute;unions et entrainements</h5>
    <textarea  name='meet_info'>R&eacute;union des chefs moniteurs
Jeudi 19 d&eacute;cembre : 18 h &agrave; 20 h --- H&ocirc;tel de Ville

R&eacute;union et entra&icirc;nement des moniteurs (MS, MSN, MSA, Aquaforme)
Vendredi 3 janvier : 11 h &agrave; 13 h --- Piscine Antoine-Brossard - Les absences doivent &ecirc;tre justifi&eacute;es avant le 20 d&eacute;cembre 2019

R&eacute;union du personnel aquatique (TOUS) 
Vendredi 3 janvier : 10 h &agrave; 11 h --- Piscine Antoine-Brossard - Les absences doivent &ecirc;tre justifi&eacute;es avant le 20 d&eacute;cembre 2019
</textarea><br>
  <h5>Consignes</h5>
    <textarea  name='guidelines'>
En cas de d&eacute;sistement, l'employ&eacute; doit remettre une preuve d&eacute;montrant un conflit d'horaire entre les disponibilit&eacute;s soumises et son horaire scolaire non connu au moment du d&eacute;p&ocirc;t des disponibilit&eacute;s OU remettre un billet m&eacute;dical qui ordonne un arr&ecirc;t de travail balis&eacute; par une date de d&eacute;but et date de fin.
Lorsque deux comp&eacute;tences sont n&eacute;cessaires pour le m&ecirc;me bloc, l'anciennet&eacute; sera &eacute;tablie en fonction de la comp&eacute;tence en rouge.
Vous devez s&eacute;lectionner des blocs pr&eacute; &eacute;tablis (blocs indissociables) complets. 
Vous pouvez s&eacute;lectionner plus d'un bloc par jour.
Vous devez indiquer un nombre maximum d'heures souhait&eacute;es. Le minimum est &agrave; titre indicatif.
Vous devez avoir vos cartes de comp&eacute;tences &agrave; jour et valides pour obtenir un horaire.
Les pr&eacute;f&eacute;rences sont &agrave; titre indicatif. La division aquatique ne s'engage pas &agrave; les respecter.  

RAPPELS
Maximum 2 remplacements par quart de travail pour l'enseignement;
Les moniteurs de natation doivent &eacute;tre disponibles au cours 1 (semaine du 6 au 12 janvier) et au cours de remise des carnets (semaine du 9 au 15 mars + 21-22 mars pour LT). SVP indiquez vos indisponibilit&eacute;s s'il y a lieu.
</textarea><br>
 <br><input type=\"submit\" value=\"Publier\" name=\"submit\">
</form>

<form action=\"create_form_info.php\" id=\"summer_avail_form\" method=\"post\" enctype=\"multipart/form-data\">
    <h2>Estival</h2>
    Titre de l'horaire: <input placeholder='Disponibilit&eacute;s  (Saison) 20XX' type='text' name='title'><br>
    Date limite: <input type='date' name='deadline'><br><br>
    Information G&eacute;n&eacute;rales &nbsp; 
    <textarea  name='gen_info'>Les cours de natation se d&eacute;rouleront du 6 janvier au 15 mars 2020 (10 sem.). Rel&acirc;che &agrave; LT SEUL. le 1er-2-3 f&eacute;vrier (reprise les 16-21-22 mars)
    
    Les cours de mise en forme se d&eacute;rouleront du 6 janvier au 19 mars (11 sem.). 
    
    Les bains libres se d&eacute;rouleront du dimanche 5 janvier au vendredi 3 avril.</textarea><br><br>
    Date de fin &nbsp; <input type='date' name='sch_end_date'><br><br>
    Date limite pour la remise des disponibilit&eacute;s &nbsp; <input type='date' name='avail_deadline'>
    <br><br>
    <input type=\"submit\" value=\"Cr&eacute;er\" name=\"submit\">
</form>
";

echo "<!DOCTYPE HTML><html>";
block_print_document_header("Template", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", "../");

session_start();

if (isset($_SESSION['user_id'])) {
    block_print_nav("");
    //TODO VALIDATE USER ACCESS
    block_print_main($content . $form_data_schedule);
} else {
    block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
    session_destroy();
}
//put code in content


block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "	</body>";
echo "</html>";


?>