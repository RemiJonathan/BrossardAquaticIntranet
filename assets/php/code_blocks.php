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

/**
 * @param $class String to use optional class if wanted
 */
function block_print_header($class){
    echo "
    <!-- Header -->
	<header $class id=\"header\">
		<span class=\"logo\"><a href=\"index.html\">Brossard <span>Secteur Aquatic</span></a></span>
		<a href=\"#menu\"><span>Menu</span></a>
	</header>
    ";
}

/**
 * @param $tabs String of <li> based on the user's connection cookie
 */
function block_print_nav($tabs){
    echo "
    <!-- Nav -->
	<nav id=\"menu\">
		<div class=\"inner\">
			<h2>Menu</h2>
			<ul class=\"links\">
				<li><a href=\"login.php\">Connexion</a></li>
				$tabs
			</ul>
			<a class=\"close\"><span>Fermer</span></a>
		</div>
	</nav>
    ";
}

function block_print_banner(){
    echo"
    <!-- Banner -->
					<section id=\"banner\">
						<div class=\"inner\">
							<h1>INTRANET DU SECTEUR AQUATIQUE DE BROSSARD</h1>
							<div class=\"content\">
								<p>Amet lorem ipsum pulvinar vehicula, orci et tellus gravida amet lorem tempus ante. Nam ut purus consequat nulla lacinia.</p>
								<ul class=\"actions special\">
									<li><a class=\"button large next\" href=\"login.php\">Connexion</a></li>
								</ul>
							</div>
						</div>
					</section>
    ";
}

function block_print_footer()
{
    echo "
    <!-- Footer -->
					<section class=\"wrapper\" id=\"footer\">
						<div class=\"inner\">
							<div class=\"split\">
								<div class=\"content\">
									<header>
										<h2>Reporter un probl&egrave;me</h2>
									</header>
									<p>Lorem ipsum dolor amet et donec convallis placerat varius. Phasellus sagittis, urna blanSapien lectus lorem tempus ut purus consequat. Sed veroeros et nisl urna lacinia lorem. Aenean at adipiscing lorem. Nunc risus augue, ullamcorper eget posuere.</p>
									<ul class=\"actions\">
										<li><a class=\"button next\" href=\"#\">Full Story</a></li>
									</ul>
								</div>
								<ul class=\"contact-icons\">
									<li><a class=\"icon alt fa-twitter\" href=\"#\"><span class=\"label\">twitter.com/untitled</span></a></li>
									<li><a class=\"icon alt fa-facebook\" href=\"#\"><span class=\"label\">facebook.com/untitled</span></a></li>
									<li><a class=\"icon alt fa-instagram\" href=\"#\"><span class=\"label\">instagram.com/untitled</span></a></li>
									<li><a class=\"icon alt fa-envelope\" href=\"#\"><span class=\"label\">contact@untitled.tld</span></a></li>
								</ul>
							</div>
						</div>
					</section>
    ";
}

function block_print_copyright(){
    echo "
    <!-- Copyright -->
	<section class=\"wrapper style2 copyright\">
		<div class=\"inner\">
			Oeuvre In&eacute;dite &copy; <span id='current_year'></span> Intranet Du Secteur Aquatique.<br />Projet De Fin D’Études Collégiales De <a href='https://remijonathan.com' target='_blank'>Rémi Jonathan Choquette</a> & <a href='https://www.linkedin.com/in/horia-sandu-7a7631162/' target='_blank'>Horia Cristian Sandu</a>.
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
