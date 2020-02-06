<?php
//ini_set('memory_limit', 1024*1024*3);

/**
 * @param $title String will set the text at the top of the page
 * @param $preamble String of the link toward the root directory
 */
function block_print_document_header($title, $preamble)
{
    echo "
    <head>
		<title>$title</title>
		<meta charset=\"utf-8\" />
		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=no\" />
		<link href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\">
		<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">
		<link rel=\"stylesheet\" href=\"" . $preamble . "assets/css/main.css\" />
	</head>
    ";
}

/**
 * @param $class String to use optional class if wanted
 * @param $preamble String to use preamble
 */
function block_print_header($class, $preamble)
{
    echo "
    <!-- Header -->
	<header $class id=\"header\">
		<span class=\"logo\"><a href=\"" . $preamble . "index.php\">Brossard <span>Secteur Aquatique</span></a></span>
		<a href=\"#menu\"><span>Menu</span></a>
	</header>
    ";
}

/**
 * @param $tabs String of <li> based on the user's connection cookie
 */
function block_print_nav($tabs)
{
    $user_id = -1;
    $db = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

    if (isset($_SESSION['user_id'])) {
        $user_id = $_SESSION['user_id'];
        $get_user_data_sql = "SELECT * FROM user WHERE user_id = '" . $user_id . "'";
        $get_user_data_res = $db->query($get_user_data_sql);
        $user_id = $get_user_data_res->fetch_array()['user_id'];
    }

    if (check_user_permissions($user_id, 1)) {
        //Todo: add all user tabs myprofile
        $tabs = "<li><a href='" . PREAMBLE . "schedule.php'>Mon horaire</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "myprofile/'>Mon profil</a></li>" . $tabs;

    } else if (check_user_permissions($user_id, 2)) {
        //Todo: add all admin tabs
        $tabs = "<li><a href='" . PREAMBLE . "qualification/'>Gestion de qualifications</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "file_operations/document_update.php'>base de donn&eacute;es</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "shift/'>Gestion de quart</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "schedule_operations/schedule_modification.php'>Sessions</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "schedule/'>Gestion d'horaire</a></li>" . $tabs;

    } else {
        //todo: add all disconnected tabs

    }
    echo "
    <!-- Nav -->
	<nav id=\"menu\">
		<div class=\"inner\">
			<h2>Menu</h2>
			<ul class=\"links\">
				$tabs
			</ul>
			<a class=\"close\"><span>Fermer</span></a>
		</div>
	</nav>
    ";
}

function block_print_banner()
{
    echo "
    <!-- Banner -->
					<section id=\"banner\">
						<div class=\"inner\">
							<h1>INTRANET DU SECTEUR AQUATIQUE DE BROSSARD</h1>
							<div class=\"content\">
								<p>Bienvenue sur la page d'accueil de l'intranet, pour continuer appuyer sur le boutton connexion.</p>
								<ul class=\"actions special\">
									<li><a class=\"button large next\" href=\"login.php\">Connexion</a></li>
								</ul>
							</div>
						</div>
					</section>
    ";
}

/**
 * @param $content String use other blocks to generate the page content
 */
function block_print_main($content)
{
    echo "
    <!-- Main -->
					<section class=\"wrapper style2\" id=\"main\">
						<div class=\"inner\">
							$content
							</div>
					</section>
    ";
}

$connection_form = "<h3>Connexion</h3><form action=\"" . PREAMBLE . "validate_connection.php\" method=\"post\">
												<div class=\"row gtr-uniform\">
													<div class=\"col-12\">
														<input id=\"username\" name=\"username\" placeholder=\"Name\" type=\"text\" value=\"\" />
														
													</div>
													<div class=\"col-12\">
														<input id=\"password\" name=\"password\" placeholder=\"Password\" type=\"password\" value=\"\" />
													</div><input type='hidden' name='currentUrl' id='currentUrl'>
													
													<a href=\"" . PREAMBLE . "forgot_password.php\">Mot de passe oublié?</a>
													<!-- Break -->
													<div class=\"col-12\">
														<ul class=\"actions\">
															<li><input type=\"submit\" value=\"Connexion\" /></li>
														</ul>
													</div>
												</div>
											</form>
											<script>window.history.replaceState({}, document.title, location.pathname );</script>";

/**
 * Use inside block_print_main()
 * @param $user String connected user's first name
 * @param $notifications String notifications related to the user
 * @return String
 */
function block_print_welcome_header($user, $notifications)
{
    return "
                            <header class=\"major special\">
								<h1>Bienvenue $user!</h1>
								<p>$notifications</p>
							</header>
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

function block_print_copyright()
{
    echo "
    <!-- Copyright -->
	<section class=\"wrapper style2 copyright\">
		<div class=\"inner\">
			Oeuvre In&eacute;dite &copy; <span id='current_year'></span> Intranet Du Secteur Aquatique.<br />Projet De Fin d'&Eacute;tudes Coll&eacute;giales De <a href='https://remijonathan.com' target='_blank'>R&eacute;mi Jonathan Choquette</a> &amp; <a href='https://www.linkedin.com/in/horia-sandu-7a7631162/' target='_blank'>Horia Cristian Sandu</a>.
		</div>
		<script>document.getElementById(\"current_year\").innerHTML = new Date().getFullYear();</script>
	</section>
    ";
}

/**
 * @param $preamble String of the link toward the root directory
 */
function block_print_scripts($preamble)
{
    echo "
    <!-- Scripts -->
			<script src=\"" . $preamble . "assets/js/jquery.min.js\"></script>
			<script src=\"" . $preamble . "assets/js/jquery.scrollex.min.js\"></script>
			<script src=\"" . $preamble . "assets/js/jquery.scrolly.min.js\"></script>
			<script src=\"" . $preamble . "assets/js/browser.min.js\"></script>
			<script src=\"" . $preamble . "assets/js/breakpoints.min.js\"></script>
			<script src=\"" . $preamble . "assets/js/util.js\"></script>
			<script src=\"" . $preamble . "assets/js/main.js\"></script>
			<script>$(document).ready(function (){
			$('#currentUrl').val(window.location.href);
			});</script>
    ";
}

/**
 * @param $user_id int of the user's id
 * @param $permission_level int of required permission
 * @return boolean see if the user has appropriate permissions
 */
function check_user_permissions($user_id, $permission_level)
{
    $db = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
    $check_permission_sql = $db->query("SELECT role_id FROM user WHERE user.user_id = '$user_id';", MYSQLI_ASSOC);

    $user = $check_permission_sql->fetch_array();

    return $user['role_id'] == $permission_level;
}

/**
 * @param $selectedWeekDay String
 *
 * @param $schedule
 * @param $db
 * @param $location
 * @return string HTML table
 */
function printWeekDayTable($selectedWeekDay, $schedule, $db, $location)
{
    $content = "";
    $content .= "<table id='$selectedWeekDay' style='empty-cells: show; table-layout: fixed; width: 100%;' class=\"alt\">
    <tbody>
    <tr><th>$selectedWeekDay</th></tr>
        ";

    $content .= '<tr><th></th></tr>';


    switch ($location) {
        case 'LT':
            $this_weeks_shifts_sql = "SELECT * FROM shift WHERE location REGEXP 'LT|LT-SALLE|PIS-LT' AND schedule_id = '$schedule' AND day = '$selectedWeekDay'";
            break;
        case 'AB':
            $this_weeks_shifts_sql = "SELECT * FROM shift WHERE location REGEXP 'AB|AB-SALLE|PIS-AB' AND schedule_id = '$schedule' AND day = '$selectedWeekDay'";
            break;
        default:
            $this_weeks_shifts_sql = "SELECT * FROM shift WHERE location = '$location' AND schedule_id = '$schedule' AND day = '$selectedWeekDay'";
            break;

    }

    $this_weeks_earliest_shift_sql = $this_weeks_shifts_sql . " ORDER BY start_time";
    $this_weeks_latest_ending_shift_sql = $this_weeks_shifts_sql . " ORDER BY end_time DESC";
    $this_weeks_shifts_res = $db->query($this_weeks_shifts_sql . " ORDER BY start_time ASC, end_time DESC");

    echo "<!--$this_weeks_shifts_sql ORDER BY start_time ASC, end_time DESC-->";


    $table_begin = $db->query($this_weeks_earliest_shift_sql)->fetch_array()['start_time'];
    $table_end = $db->query($this_weeks_latest_ending_shift_sql)->fetch_array()['end_time'];


    $index = 0;
    $shift_array = array();
    while ($shift = $this_weeks_shifts_res->fetch_array(MYSQLI_ASSOC)) {
        $start_time = strtotime($shift['start_time']);
        $end_time = strtotime($shift['end_time']);

        $shift_array[$index] = $shift;

        $duration = round(abs($end_time - $start_time) / 60, 2);
        $shift_array[$index]['html'] = '<td class="shift';
        if (!is_null($shift['assigned_user'])) $shift_array[$index]['html'] .= ' user' . $shift['assigned_user'] . ' selected';
        $shift_array[$index]['html'] .= '" rowspan="' . (($duration / 5)) . '" data-start="'.$shift['start_time'].'" data-end="'.$shift['end_time'].'" id="'.$shift['shift_id'].'">' . $shift['description'];

        //if (!is_null($shift['assigned_user'])) echo '<br />' . $shift['assigned_user'];

        $shift_array[$index]['html'] .= /*date('H:i',$start_time).' - '.date('H:i',$end_time).*/
            '</td>';

        $shift_array[$index]['duration'] = $duration;

        $index++;
    }

    $counter = 0;
    for ($i = strtotime($table_begin); $i < strtotime($table_end); $i += (5 * 60)) {
        $content .= "<tr>";
        for ($j = 0; $j < 2; $j++) {
            switch ($j) {
                case 0:
                    if ($i % 1800 == 0) {
                        $content .= "<th  style='padding: 4em;' rowspan='6'>" . date('G:i', $i) . "</th>";
                        $counter++;
                    } else {
                        if (strtotime($table_begin) % 1800 != 0 && ($i - strtotime($table_begin) < 1800) && $counter == 0) {
                            $content .= "<th rowspan='" . (6 - (($i % 1800) / 300)) . "'></th>";
                            $counter++;
                        } else {
                            $content .= "<th style='display: none'></th>";
                        }
                    }
                    break;
                default:
                    $number = 0;
                    foreach ($shift_array as $key => $shift) {

                        if (strcmp($shift['day'], $selectedWeekDay) == 0) {
                            if (date($shift['start_time']) == date('H:i:s', $i)) {
                                $content .= $shift['html'];
                                $number++;
                            } else if (date($shift['end_time']) > date('H:i:s', $i) && date($shift['start_time']) < date('H:i:s', $i)) {
                                $number++;
                                $content .= "<td style='display: none'></td>";
                            }
                        }
                    }
                    break;
            }

        }

        $content .= "</tr>";

    }

    $content .= "</tbody></table>";

    return $content;
}

/**
 * @param $seniority_type
 * @param $db
 */
function print_seniority_dropdown($seniority_type, $db)
{
    $get_seniority_sql = "SELECT * FROM seniority LEFT OUTER JOIN user u on seniority.user_id = u.user_id WHERE seniority_type = '$seniority_type' ORDER BY hours DESC, continued_service;";
    $get_seniorty_res = $db->query($get_seniority_sql);

    echo "<ol class=\"list-group $seniority_type\" style='max-height: 250px; overflow-y:scroll; display: none'>";

    while ($user = $get_seniorty_res->fetch_array(MYSQLI_ASSOC)) {
        $id = 'user' . $user['user_id'];
        echo "<li id='$id' class='list-group-item list-group-item-action' style='font-size: small; '>";
        //echo $user['user_id']."<br />";
        echo $user['user_fname'] . " " . $user['user_lname'];
        echo "<br /><strong>" . $user['hours'] . "</strong>";
        echo "</li>";
    }

    echo "</ol>";
}