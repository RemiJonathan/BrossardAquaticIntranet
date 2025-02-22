<?php

define("PREAMBLE","../");

include (PREAMBLE."db_operations/connection.php");
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$content ="";
$fileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Check if document is actually CSV format
if(isset($_POST["submit"])) {

    $check = $fileType == "csv";
    if ($check !== false) {
        $message = "Correct";
        $uploadOk = 1;
    } else {
        $message = "Fichier manquant ou incorrect (Doit être de type CSV)";
        $uploadOk = 0;
        $content .= "<SCRIPT type='text/javascript'> 
        alert('$message');
        window.location.replace('document_update.php');
    </SCRIPT>";

    }
}
    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 5000000) {
        $content .=  "Sorry, your file is too large.";
        $uploadOk = 0;
    }


// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    $content .= "<SCRIPT type='text/javascript'> 
        alert('Erreur, fichier incorrect');
        window.location.replace('schedule_creation.php');
    </SCRIPT>";
// if everything is ok, try to upload file
} else {
    $newName = $target_dir . 'list_surv_snr.csv';
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $newName)) {
        $message = "";
        $content .= "
<form action='db_update_surv_snr.php' id='updateSurv' method='post' enctype='multipart/form-data'>
    <h5>Mettre &agrave; jour la liste d'anciennet&eacute; de surveillance</h5>

<input type=\"submit\" value=\"Mettre &agrave; jour\" name=\"submit\">
</form>";
        $content .= $message . '<a href="document_update.php">Annuler</a>';

    } else {
        $content .=  "Sorry, there was an error uploading your file.";
    }
}


?>

<?php

include ("../assets/php/code_blocks.php");

echo "<!DOCTYPE HTML><html>";
block_print_document_header("Anciennet&eacute;", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
//TODO: put logic to verify cookie and modify this
block_print_nav("<li><a href=\"".PREAMBLE."login.php\">Connexion</a></li>");

//put code in content
block_print_main($content);

block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "	</body>";
echo "</html>";

?>
