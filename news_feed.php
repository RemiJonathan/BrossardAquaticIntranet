<?php
include ("assets/php/code_blocks.php");
include ("db_operations/connection.php");

echo "<!DOCTYPE HTML><html>";
block_print_document_header("Acceuil",'');
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("");

block_print_main("
    <form class=\"form-horizontal\" action=\"\" method=\"post\" name=\"uploadCSV\"
    enctype=\"multipart/form-data\">
    <div class=\"input-row\">
        <label class=\"col-md-4 control-label\">Choose CSV File</label> <input
            type=\"file\" name=\"file\" id=\"file\" accept=\".csv\">
        <button type=\"submit\" id=\"submit\" name=\"import\"
            class=\"btn-submit\">Import</button>
        <br />

    </div>
    <div id=\"labelError\"></div>
</form>

<script type=\"text/javascript\">
	$(document).ready(
	function() {
		$(\"#frmCSVImport\").on(
		\"submit\",
		function() {

			$(\"#response\").attr(\"class\", \"\");
			$(\"#response\").html(\"\");
			var fileType = \".csv\";
			var regex = new RegExp(\"([a-zA-Z0-9\s_\\.\-:])+(\"
					+ fileType + \")$\");
			if (!regex.test($(\"#file\").val().toLowerCase())) {
				$(\"#response\").addClass(\"error\");
				$(\"#response\").addClass(\"display-block\");
				$(\"#response\").html(
						\"Invalid File. Upload : <b>\" + fileType
								+ \"</b> Files.\");
				return false;
			}
			return true;
		});
	});
</script>
");

block_print_copyright();
echo "    </div>";
block_print_scripts('');
echo "	</body>";
echo "</html>";

