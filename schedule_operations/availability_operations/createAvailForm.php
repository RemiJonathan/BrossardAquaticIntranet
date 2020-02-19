<?php
//ATTENTION: THIS FILE WILL BEGIN TO HAVE UNDETECDABLE ERRORS IF IT GETS TOO LONG
define("PREAMBLE", "../../");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");

include(PREAMBLE . "assets/php/code_blocks.php");
session_start();
block_print_scripts(PREAMBLE);
$qualArray = getQualArray($db);
$optionStringForQuals = "";
foreach ($qualArray as $qual) {

    $optionStringForQuals .= "<option value='" . $qual['qualification_id'] . "'>" . $qual['qual_name'] . "</option>";
}
$sessionsArray = getSessions($db);
$current_sch = $_GET["sch_id"];
$form_data_schedule = "";
$form_data_schedule1 = "";
$content = "";
$content .= "<script type='text/javascript'>

function deleteRow(row) {
row.closest('tr').remove();

}

function addRow(row) {
    var htmlString = '<tr>' + row.closest('tr').html() + '</tr>';
   
row.closest('tr').after(htmlString);
}

window.onload = function() {
var cat = document.getElementsByClassName('cat_sel');
var qual = document.getElementsByClassName('qual_sel');
 
  for (i = 0; i < cat.length; i++) {
     if(cat[i].value =='Enseignement'){
      qual[i].selectedIndex=1;
     }
     if(cat[i].value =='Entrainement du Personnel (MS / MSN)'){
      qual[i].selectedIndex=2;
     }
     if(cat[i].value =='Entrainement des MSA (Chef MSA / ISA)'){
      qual[i].selectedIndex=1;
     }
     if(cat[i].value =='Premiers Soins General (MSU)'){
      qual[i].selectedIndex=3;
     }
}
  

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
$content .= "<h2>Formulaire de disponibilit&eacute;s</h2><button id='summerButton' \">Reg/&Eacute;t&eacute;</button><br><br>";
//TODO add option to create new semester and add files to it
$form_data_schedule .= "<form action=\"create_form_info.php\" id=\"reg_avail_form\" method=\"get\" enctype=\"multipart/form-data\" >";

$form_data_schedule .= "<input type='hidden' name='sch_id' value='$current_sch'>
  
    <h2>R&eacute;gulier</h2>
    <h5>Titre du formulaire:</h5> <input placeholder='Disponibilit&eacute;s  (Saison) 20XX' type='text' name='title'><br>
    <h5>Date limite:</h5> <input type='date' name='deadline'><br><br>
    <h5>Information G&eacute;n&eacute;rales </h5>
    <textarea   rows='9'   name='gen_info'>Les cours de natation se d&eacute;rouleront du 6 janvier au 15 mars 2020 (10 sem.). Rel&acirc;che &agrave; LT SEUL. le 1er-2-3 f&eacute;vrier (reprise les 16-21-22 mars)
    
    Les cours de mise en forme se d&eacute;rouleront du 6 janvier au 19 mars (11 sem.). 
    
    Les bains libres se d&eacute;rouleront du dimanche 5 janvier au vendredi 3 avril.</textarea><br>
    <h5>R&eacute;unions et entrainements</h5>
    <textarea  rows='9' name='meet_info'>R&eacute;union des chefs moniteurs
Jeudi 19 d&eacute;cembre : 18 h &agrave; 20 h --- H&ocirc;tel de Ville

R&eacute;union et entra&icirc;nement des moniteurs (MS, MSN, MSA, Aquaforme)
Vendredi 3 janvier : 11 h &agrave; 13 h --- Piscine Antoine-Brossard - Les absences doivent &ecirc;tre justifi&eacute;es avant le 20 d&eacute;cembre 2019

R&eacute;union du personnel aquatique (TOUS) 
Vendredi 3 janvier : 10 h &agrave; 11 h --- Piscine Antoine-Brossard - Les absences doivent &ecirc;tre justifi&eacute;es avant le 20 d&eacute;cembre 2019
</textarea><br>
  <h5>Consignes</h5>
    <textarea     rows='9'  name='guidelines'>
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
<h3>Blocs Horaire</h3>
<div style='display: inline-block;
    overflow-y: scroll;
    max-height:600px;'>
<table id='block_table' >


<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi' selected>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='05:30' name='start_time[]' required>
<input type='time' value='07:15' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement '>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>


<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi' selected>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='20:45' name='start_time[]' required>
<input type='time' value='22:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement'>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>";

$form_data_schedule .= "
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi' selected>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='05:15' name='start_time[]' required>
<input type='time' value='07:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement'>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi' selected>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='18:45' name='start_time[]' required>
<input type='time' value='20:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement'>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi' selected>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='20:45' name='start_time[]' required>
<input type='time' value='22:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement'>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi' selected>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='05:30' name='start_time[]' required>
<input type='time' value='07:15' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement'>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>

<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi' selected>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='12:45' name='start_time[]' required>
<input type='time' value='17:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement'>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi' selected>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='18:45' name='start_time[]' required>
<input type='time' value='21:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement'>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche' selected>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='08:00' name='start_time[]' required>
<input type='time' value='11:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>";

$form_data_schedule .= "
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche' selected>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='11:00' name='start_time[]' required>
<input type='time' value='13:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche' selected>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='15:30' name='start_time[]' required>
<input type='time' value='18:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi' selected>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='18:00' name='start_time[]' required>
<input type='time' value='20:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi' selected>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='18:30' name='start_time[]' required>
<input type='time' value='20:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi' selected>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='16:00' name='start_time[]' required>
<input type='time' value='17:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi' selected>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='18:00' name='start_time[]' required>
<input type='time' value='20:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi' selected>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='19:00' name='start_time[]' required>
<input type='time' value='20:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi' selected>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='20:00' name='start_time[]' required>
<input type='time' value='21:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>";

$form_data_schedule .= "
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi' selected>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='18:00' name='start_time[]' required>
<input type='time' value='21:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi' selected>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='20:30' name='start_time[]' required>
<input type='time' value='22:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi' selected>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='20:00' name='start_time[]' required>
<input type='time' value='21:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi' selected>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='16:00' name='start_time[]' required>
<input type='time' value='17:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi' selected>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='18:00' name='start_time[]' required>
<input type='time' value='20:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi' selected>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='19:00' name='start_time[]' required>
<input type='time' value='20:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi' selected>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='20:00' name='start_time[]' required>
<input type='time' value='21:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi' selected>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='20:00' name='start_time[]' required>
<input type='time' value='21:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>";

$form_data_schedule .= "
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi' selected>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='18:00' name='start_time[]' required>
<input type='time' value='19:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi' selected>Vendredi</option>
<option  value='Samedi'>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='19:00' name='start_time[]' required>
<input type='time' value='21:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi' selected>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='08:00' name='start_time[]' required>
<input type='time' value='11:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi' selected>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='11:00' name='start_time[]' required>
<input type='time' value='13:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi' selected>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='13:00' name='start_time[]' required>
<input type='time' value='15:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi' selected>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='13:15' name='start_time[]' required>
<input type='time' value='17:30' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi' selected>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='13:00' name='start_time[]' required>
<input type='time' value='18:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>
<tr>
<td style='width:20%;'>
   
<select name='day[]'> 
<option  value='Dimanche'>Dimanche</option>
<option  value='Lundi'>Lundi</option>
<option  value='Mardi'>Mardi</option>
<option  value='Mercredi'>Mercredi</option>
<option  value='Jeudi'>Jeudi</option>
<option  value='Vendredi'>Vendredi</option>
<option  value='Samedi' selected>Samedi</option>
</select>   
</td>
<td style='width:30%;'>
<input type='time' value='16:00' name='start_time[]' required>
<input type='time' value='21:00' name='end_time[]' required>
</td>
<td style='width:15%;'>
<select name='required_qual[]' class='qual_sel'>
.$optionStringForQuals.
</select>
</td>
<td>
<select name='block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement' selected>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>

<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr></table></div>";

$form_data_schedule .= "

<br><br>
<h4>Blocs Sp&eacute;ciaux</h4>
<table>
<tr>
<th>Dates</th>
<th>Heures</th>
<th>Qualif.</th>
<th>Cat&eacute;gorie</th>
<th>Action</th>
<th></th>
</tr>


<tr>
<td style='width:20%;'>
<input type='date' value='2020-04-04' name='spec_start_date[]'><br>au<br><input type='date' value='2020-04-05' name='spec_end_date[]'>
</td>
<td style='width:30%;'>
<input type='time' value='08:00' name='spec_start_time[]' required>&nbsp;&agrave;&nbsp;
<input type='time' value='17:00' name='spec_end_time[]' required>
</td>
<td style='width:15%;'>
<select name='spec_required_qual[]' class='qual_sel'>
$optionStringForQuals
</select>
</td>
<td>
<select name='spec_block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement'>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)'>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)' selected>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>
<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>   
<tr>
<td style='width:20%;'>
<input type='date' value='2020-04-04' name='spec_start_date[]'><br>au<br><input type='date'  name='spec_end_date[]'>
</td>
<td style='width:30%;'>
<input type='time' value='08:00' name='spec_start_time[]' required>&nbsp;&agrave;&nbsp;
<input type='time' value='17:00' name='spec_end_time[]' required>
</td>
<td style='width:15%;'>
<select name='spec_required_qual[]' class='qual_sel'>
$optionStringForQuals
</select>
</td>
<td>
<select name='spec_block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement'>Enseignement</option>
<option  value='Entrainement du Personnel (MS / MSN)' selected>Entrainement du Personnel (MS / MSN)</option>
<option  value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>
<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>  
<tr>
<td style='width:20%;'>
<input type='date' value='2020-04-04' name='spec_start_date[]'><br>au<br><input type='date'  name='spec_end_date[]'>
</td>
<td style='width:30%;'>
<input type='time' value='08:00' name='spec_start_time[]' required>&nbsp;&agrave;&nbsp;
<input type='time' value='17:00' name='spec_end_time[]' required>
</td>
<td style='width:15%;'>
<select name='spec_required_qual[]' class='qual_sel'>
$optionStringForQuals
</select>
</td>
<td>
<select name='spec_block_cat[]' class='cat_sel'>
<option  value='Surveillance'>Surveillance</option>
<option  value='Enseignement'>Enseignement</option>
<option    value='Entrainement du Personnel (MS / MSN) '>Entrainement du Personnel (MS / MSN)</option>
<option  selected value='Entrainement des MSA (Chef MSA / ISA)'>Entrainement des MSA (Chef MSA / ISA)</option>
<option  value='Premiers Soins General (MSU)'>Premiers Soins General (MSU)</option>
<option  value='Autre'>Autre</option>
</select>
</td>
<td>
<p onclick='deleteRow($(this))'><b>Supp.</b></p>
    <td>
    <p onclick='addRow($(this))'><b>Ajouter Apr&egrave;s</b></p>
    </td>
</td>
</tr>  





</table>
 <br><input type=\"submit\" value=\"Publier\" name=\"submit\">
 </form>";

$form_data_schedule .= "
<form action=\"create_form_info.php\" id=\"summer_avail_form\" method=\"post\" enctype=\"multipart/form-data\">
    
    <h2>Estival</h2>
    Titre de l'horaire: <input placeholder='Disponibilit&eacute;s  (Saison) 20XX' type='text' name='title'><br>
    Date limite: <input type='date' name='deadline'><br><br>
    Information G&eacute;n&eacute;rales &nbsp; 
    <textarea  name='gen_info'>Les cours de natation se d&eacute;rouleront du 6 janvier au 15 mars 2020 (10 sem.). Rel&acirc;che &agrave; LT SEUL. le 1er-2-3 f&eacute;vrier (reprise les 16-21-22 mars)
    <pre>
    Les cours de mise en forme se d&eacute;rouleront du 6 janvier au 19 mars (11 sem.). 
    
    Les bains libres se d&eacute;rouleront du dimanche 5 janvier au vendredi 3 avril.</pre></textarea><br><br>
    Date de fin &nbsp; <input type='date' name='sch_end_date'><br><br>
    Date limite pour la remise des disponibilit&eacute;s &nbsp; <input type='date' name='avail_deadline'>
    <br><br>
    <input type=\"submit\" value=\"Cr&eacute;er\" name=\"submit\">
</form>

";


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Cr&eacute;er Dispo", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", "../");


if (isset($_SESSION['user_id'])) {
    block_print_nav("");
    //TODO VALIDATE USER ACCESS
    block_print_main($content . $form_data_schedule . $form_data_schedule1);
} else {
    block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
    session_destroy();
}
//put code in content


block_print_copyright();
echo "    </div>";

echo "	</body>";
echo "</html>";


?>