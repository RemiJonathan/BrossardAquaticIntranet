<?php
define('PREAMBLE', '../../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");
include(PREAMBLE . "db_operations/db_functions.php");
ini_set('intl.default_locale', 'de-DE');
$sch_id = "";
if (isset($_POST['sch_id'])) {
    $sch_id = $_POST['sch_id'];
}


$qualArray = getQualArray($db);
$availInstruc = getAvailInstructions($db);
$availBlocks = getAvailBlocks($db);
$specAvailBlocks = getSpecAvailBlocks($db);
$schedules = getSchedules($db);
$content = "";
$dispoFound = false;
$currentInstruc = "";
$simpleQualArray = array();
$labelCounter = 1;
$enlabelCounter = 1;
session_start();
if (!(isset($_SESSION['user_id']))) {
    session_destroy();
    header("location:login.php");
}

foreach ($qualArray as $qual) {
    $simpleQualArray[] = $qual['qual_name'];
}

if (isset($_POST['sch_id'])) {

    foreach ($availInstruc as $key => $instruc) {
        if ($sch_id == $instruc['sch_id']) {
            $dispoFound = true;
            $currentInstruc = $availInstruc[$key];
            break;
        }
    }

    if ($dispoFound) {
        $content .= "<h1 class='display-3'>" . $currentInstruc["title"] . "</h1>
        <p  class='  bg-danger' style='font-size: 110%'>&nbsp;Date de remise: <b>" . $currentInstruc["deadline"] . "</b></p>
        <h2>Informations G&eacute;n&eacute;rales</h2><hr>
        <p >" . nl2br($currentInstruc['gen_info']) . "</p>
        <h2>R&eacute;unions et entrainements OBLIGATOIRES du personnel</h2>
        <hr>
        <p >" . nl2br($currentInstruc['meet_info']) . "</p>
        <h2>Consignes pour remplir la grille de disponibilit&eacute;s</h2>
       
         <p >" . nl2br($currentInstruc['guidelines']) . "</p>
        <hr>";

        $content .= "
        
  
        <div class='col-12' >
        <form action='db_insert_avails.php' method='post'>
        <input type='hidden' name='sch_id' value=" . $_POST['sch_id'] . ">
        <input type='hidden' name='user_id' value=" . $_SESSION['user_id'] . ">
        <div class='col-6' style='float:left'><h2>SURVEILLANCE</h2>
        
        <table class='table-striped table-bordered'>
        <tr>
        <th style='font-size: 110%'>Jour</th>
        <th style='font-size: 110%'>Heures</th>
        <th style='font-size: 110%'>Qualif. Requise</th>
        <th style='font-size: 110%'>Cocher</th></tr>";

        foreach ($availBlocks as $block) {
            if ($block['category'] == "Surveillance") {
                $completeLabel = "label" . $labelCounter;
                $content .= "<input type='hidden' value=" . $block['block_id'] . ">";
                $content .= "<tr>
                <td>" . $block['day'] . "</td>
                <td>" . date("H:i", strtotime($block['start_time'])) . "-" . date("H:i", strtotime($block['end_time'])) . "</td>
                <td>" . $simpleQualArray[$block['required_qual'] - 1] . "</td>
                <td> <input id='$completeLabel' name=\"isAvail[]\" type=\"checkbox\" value='" . $block['block_id'] . "'><label for='$completeLabel'></label></td>
                </tr>
                
                ";
                $labelCounter++;
            }
        }
        $content .= "</table>";

        $content .= "<table class='table-striped table-bordered'>";
        foreach ($specAvailBlocks as $block) {
            if ($block['block_cat'] == "Premiers Soins General (MSU)") {
                $completeLabel = "label" . $labelCounter;
                $content .= "<input type='hidden' value=" . $block['block_id'] . ">";

                $startDate = strftime("%A", strtotime($block['start_date']));
                $endDate = strftime("%A", strtotime($block['end_date']));
                if ($startDate == 'Monday') {
                    $startDate = 'Lundi';
                } else if ($startDate == 'Tuesday') {
                    $startDate = 'Mardi';
                } else if ($startDate == 'Wednesday') {
                    $startDate = 'Mercredi';
                } else if ($startDate == 'Thursday') {
                    $startDate = 'Jeudi';
                } else if ($startDate == 'Friday') {
                    $startDate = 'Vendredi';
                } else if ($startDate == 'Saturday') {
                    $startDate = 'Samedi';
                } else {
                    $startDate = 'Dimanche';
                }

                if ($endDate == 'Monday') {
                    $endDate = 'Lundi';
                } else if ($endDate == 'Tuesday') {
                    $endDate = 'Mardi';
                } else if ($endDate == 'Wednesday') {
                    $endDate = 'Mercredi';
                } else if ($endDate == 'Thursday') {
                    $endDate = 'Jeudi';
                } else if ($endDate == 'Friday') {
                    $endDate = 'Vendredi';
                } else if ($endDate == 'Saturday') {
                    $endDate = 'Samedi';
                } else {
                    $endDate = 'Dimanche';
                }

                $content .= "
                <tr>
                <th colspan='4' style='font-size: 110%;text-align: center;'>" . $block['block_cat'] . "</th>
                
</tr>";
                $content .= "<tr><td>" . $startDate . " et " . $endDate . "</td>
<td>" . date("d/m/y", strtotime($block['start_date'])) . "<br>-<br>" . date("d/m/y", strtotime($block['end_date'])) . "</td>
<td>" . date("H:i", strtotime($block['start_time'])) . "<br>-<br>" . date("H:i", strtotime($block['end_time'])) . "</td>
 <td> <input id='$completeLabel' name=\"isAvailSpec[]\" type=\"checkbox\" value='" . $block['block_id'] . "'><label for='$completeLabel'></label></td>



</tr>";
                $labelCounter++;
            }
            $content .= "</table>";
        }

        $content .= "<table class='table-striped table-bordered'>";
        foreach ($specAvailBlocks as $block) {
            if ($block['block_cat'] == "Entrainement des MSA (Chef MSA / ISA)") {
                $completeLabel = "label" . $labelCounter;
                $content .= "<input type='hidden' value=" . $block['block_id'] . ">";

                $startDate = strftime("%A", strtotime($block['start_date']));
                $endDate = strftime("%A", strtotime($block['end_date']));
                if ($startDate == 'Monday') {
                    $startDate = 'Lundi';
                } else if ($startDate == 'Tuesday') {
                    $startDate = 'Mardi';
                } else if ($startDate == 'Wednesday') {
                    $startDate = 'Mercredi';
                } else if ($startDate == 'Thursday') {
                    $startDate = 'Jeudi';
                } else if ($startDate == 'Friday') {
                    $startDate = 'Vendredi';
                } else if ($startDate == 'Saturday') {
                    $startDate = 'Samedi';
                } else {
                    $startDate = 'Dimanche';
                }

                if ($endDate == 'Monday') {
                    $endDate = 'Lundi';
                } else if ($endDate == 'Tuesday') {
                    $endDate = 'Mardi';
                } else if ($endDate == 'Wednesday') {
                    $endDate = 'Mercredi';
                } else if ($endDate == 'Thursday') {
                    $endDate = 'Jeudi';
                } else if ($endDate == 'Friday') {
                    $endDate = 'Vendredi';
                } else if ($endDate == 'Saturday') {
                    $endDate = 'Samedi';
                } else {
                    $endDate = 'Dimanche';
                }

                $content .= "
                <tr>
                <th colspan='4' style='font-size: 110%;text-align: center;'>" . $block['block_cat'] . "<br></th>
              
</tr>";
                $content .= "<tr><td>" . $startDate . "</td>
<td>" . date("d/m/y", strtotime($block['start_date'])) . "</td>
<td>" . date("H:i", strtotime($block['start_time'])) . "<br>-<br>" . date("H:i", strtotime($block['end_time'])) . "</td>
 <td> <input id='$completeLabel' name=\"isAvailSpec[]\" type=\"checkbox\" value='" . $block['block_id'] . "'><label for='$completeLabel'></label></td>
 </tr>
";
                $labelCounter++;
            }

            if ($block['block_cat'] == "Entrainement du Personnel (MS / MSN)") {
                $completeLabel = "label" . $labelCounter;
                $content .= "<input type='hidden' value=" . $block['block_id'] . ">";

                $startDate = strftime("%A", strtotime($block['start_date']));
                $endDate = strftime("%A", strtotime($block['end_date']));
                if ($startDate == 'Monday') {
                    $startDate = 'Lundi';
                } else if ($startDate == 'Tuesday') {
                    $startDate = 'Mardi';
                } else if ($startDate == 'Wednesday') {
                    $startDate = 'Mercredi';
                } else if ($startDate == 'Thursday') {
                    $startDate = 'Jeudi';
                } else if ($startDate == 'Friday') {
                    $startDate = 'Vendredi';
                } else if ($startDate == 'Saturday') {
                    $startDate = 'Samedi';
                } else {
                    $startDate = 'Dimanche';
                }

                if ($endDate == 'Monday') {
                    $endDate = 'Lundi';
                } else if ($endDate == 'Tuesday') {
                    $endDate = 'Mardi';
                } else if ($endDate == 'Wednesday') {
                    $endDate = 'Mercredi';
                } else if ($endDate == 'Thursday') {
                    $endDate = 'Jeudi';
                } else if ($endDate == 'Friday') {
                    $endDate = 'Vendredi';
                } else if ($endDate == 'Saturday') {
                    $endDate = 'Samedi';
                } else {
                    $endDate = 'Dimanche';
                }

                $content .= "
                <tr>
                <th colspan='4' style='font-size: 110%;text-align: center;'>" . $block['block_cat'] . "<br></th>
              
</tr>";
                $content .= "<tr><td>" . $startDate . "</td>
<td>" . date("d/m/y", strtotime($block['start_date'])) . "</td>
<td>" . date("H:i", strtotime($block['start_time'])) . "<br>-<br>" . date("H:i", strtotime($block['end_time'])) . "</td>
 <td> <input id='$completeLabel' name=\"isAvailSpec[]\" type=\"checkbox\" value='" . $block['block_id'] . "'><label for='$completeLabel'></label></td>
 </tr>
";

            }
            $labelCounter++;

        }


        $content .= "</table>";
        $content .= "<table><tr>
                <th colspan='4' style='font-size: 110%;text-align: center;'>Nombre d'heures souhait&eacute;<br></th></tr>
                <tr><th colspan='4' style='font-size: 110%;text-align: center;'>Maximum<br></th></tr>
                <tr><td style='text-align: center;'><input  required value ='0' type='number' min='0' name='maxHours'> </td></tr>
              
</tr>

</table>
<h5>Commentaires</h5>
<textarea placeholder='Les pr&eacute;f&eacute;rences sont &agrave; titre indicatif. La division aquatique ne s&apos;engage pas &agrave; les respecter.  ' name='comments' maxlength='300'></textarea><br><input type='radio' id='avail1' name='availType' value='avail' selected><label for='avail1'>Disponible pour un horaire r&eacute;gulier</label>
<input type='radio' id='avail2' name='availType' value='availForReplacements'><label for='avail2'>Disponible pour des remplacements</label>
<input type='radio' id='avail3' name='availType' value='unavail'><label for='avail3'>Non Disponible</label>
";

        $content .= "</div>";
        $content .= "
        <div class='col-6' style='float:right'><h2>Enseignement</h2>

        <table class='table-striped table-bordered'>
        <tr>
        <th style='font-size: 110%'>Jour</th>
        <th style='font-size: 110%'>Heures</th>
        <th style='font-size: 110%'>Qualif. Requise</th>
        <th style='font-size: 110%'>Cocher</th></tr>";

        foreach ($availBlocks as $block) {
            if ($block['category'] == "Enseignement") {
                $completeLabel = "label" . $labelCounter;
                $content .= "<input type='hidden' value=" . $block['block_id'] . ">";
                $content .= "<tr>
                <td>" . $block['day'] . "</td>
                <td>" . date("H:i", strtotime($block['start_time'])) . "-" . date("H:i", strtotime($block['end_time'])) . "</td>
                <td>" . $simpleQualArray[$block['required_qual'] - 1] . "</td>
                <td>  <input id='$completeLabel' name=\"isAvail[]\" type=\"checkbox\" value='" . $block['block_id'] . "'><label for='$completeLabel'></label></td>
                </tr>
                
                ";
                $labelCounter++;
            }
        }
        $content .= "</table></div><br>
<br><br>
<input type='submit' style='width:100%' value='Envoyer'>

</form></div>";


    } else {
        $content .= "<h3>Le formulaire pour cette session n'est pas encore disponible!</h3>
<a href='user_form.php'>Retour</a>";
    }

} else {
    $content .= "<h1>Transmission des disponibilit&eacute;s</h1><h3>S&eacute;lectionner une session</h3><form action='user_form.php' method='post'>
<select name='sch_id'>";
    foreach ($schedules as $schedule) {
        $content .= "<option value=" . $schedule['sch_id'] . ">" . $schedule['title'] . "</option>";
    }
    $content .= "</select>";
    $content .= "<br><input type='submit' value='Suivant'>";
}
echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);


block_print_nav("<li></li>");
block_print_main($content);

block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);

echo "	</body>";
echo "</html>";
