<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
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
        echo "<SCRIPT type='text/javascript'> //not showing me this
        alert('$message');
        window.location.replace('document_update.php');
    </SCRIPT>";

    }
}
    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 5000000) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
    }


// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "<SCRIPT type='text/javascript'> //not showing me this
        alert('Erreur, fichier incorrect');
        window.location.replace('document_update.php');
    </SCRIPT>";
// if everything is ok, try to upload file
} else {
    $newName = $target_dir . 'list_emp.csv';
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $newName)) {
        $message =  "<p>Le fichier ". basename( $_FILES["fileToUpload"]["name"]). " a &eacute;t&eacute; charg&eacute; avec succ&egrave;s.</p>";
        echo basename($_FILES["fileToUpload"]["name"]);
        echo $message .'<br><a href="document_update.php">Retour</a>';

    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}


?>