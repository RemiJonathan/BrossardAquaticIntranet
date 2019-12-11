<?php

/**
 * @param $title String will set the text at the top of the page
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

function block_print_header(){
    echo "
    <!-- Header -->
	<header class=\"alt\" id=\"header\">
		<span class=\"logo\"><a href=\"index.html\">Brossard <span>Secteur Aquatic</span></a></span>
		<a href=\"#menu\"><span>Menu</span></a>
	</header>
    ";
}


function block_print_footer()
{
    echo "";
}

function block_print_copyright(){
    echo "
    <!-- Copyright -->
	<section class=\"wrapper style2 copyright\">
		<div class=\"inner\">
			Oeuvre In&eacute;dite &copy; <span id='current_year'></span> Intranet Du Secteur Aquatique. Projet De Fin D’Études Collégiales De <a href='https://remijonathan.com' target='_blank'>Rémi Jonathan Choquette</a> & <a href='https://www.linkedin.com/in/horia-sandu-7a7631162/' target='_blank'>Horia Cristian Sandu</a>.
		</div>
		<script>document.getElementById(\"current_year\").innerHTML = new Date().getFullYear();</script>
	</section>
    ";
}

function block_print_scripts(){
    echo"
    <!-- Scripts -->
			<script src=\"assets/js/jquery.min.js\"></script>
			<script src=\"assets/js/jquery.scrollex.min.js\"></script>
			<script src=\"assets/js/jquery.scrolly.min.js\"></script>
			<script src=\"assets/js/browser.min.js\"></script>
			<script src=\"assets/js/breakpoints.min.js\"></script>
			<script src=\"assets/js/util.js\"></script>
			<script src=\"assets/js/main.js\"></script>
    ";
}
