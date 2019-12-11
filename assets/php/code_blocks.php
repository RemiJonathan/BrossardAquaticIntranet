<?php

/**
 * @param $title will set the text at the top of the page
 */
function block_print_document_header($title)
{
    echo "
    <head>
		<title>$title</title>
		<meta charset=\"utf-8\" />
		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=no\" />
		<link rel=\"stylesheet\" href=\"assets/css/main.css\" />
	</head>
    ";
}


function block_print_footer()
{
    echo "";
}
