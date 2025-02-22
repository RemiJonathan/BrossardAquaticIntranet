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
		<style>
		td{
  display:block;
  width:auto;
padding-bottom:10px;
}
th{
display: none;
}

@media only screen and (min-width: 25em) {
  td{
    display:table-cell;
    margin-bottom:0px;
  }
  
  th{
    display: table-cell;
  }
  
}

@media print {
    body {transform: scale(.9);}
    table {page-break-inside: avoid;}
    td{
    display:table-cell;
    margin-bottom:0px;
  }
}

.qual{
font-size: small;
padding: 5px;
    border: black 1px solid;
    border-radius: 40px;
    text-align: center;
}

.avail{
    background-color: #8A2BE2;
}
</style>
<script src=\"https://kit.fontawesome.com/94f2f9ffaa.js\" crossorigin=\"anonymous\"></script>
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
        $tabs = "<li><a href='" . PREAMBLE . "logout.php'>D&eacute;connexion</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "schedule_operations/availability_operations/user_form.php'>Disponibilit&eacute;s</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "myprofile/'>Mon profil</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "news_feed.php'>Fil d'actualit&eacute;</a></li>" . $tabs;


    } else if (check_user_permissions($user_id, 2)) {
        //Todo: add all admin tabs
        $tabs = "<li><a href='" . PREAMBLE . "logout.php'>D&eacute;connexion</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "reports/ens_snr_report.php'>Liste Enseignement</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "reports/surv_snr_report.php'>Liste Surveillance</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "qualification/'>Gestion de qualifications</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "file_operations/document_update.php'>base de donn&eacute;es</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "shift/'>Gestion de quart</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "schedule_operations/schedule_modification.php'>Sessions</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "schedule/'>Gestion d'horaire</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "articles/'>articles</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "news_feed.php'>Fil d'actualit&eacute;</a></li>" . $tabs;


    } else if (check_user_permissions($user_id, 3)) {
        //Todo: add all admin tabs
        $tabs = "<li><a href='" . PREAMBLE . "logout.php'>D&eacute;connexion</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "articles/'>articles</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "news_feed.php'>Fil d'actualit&eacute;</a></li>" . $tabs;

    }
    else if (check_user_permissions($user_id, 4)) {
        //Todo: add all admin tabs
        $tabs = "<li><a href='" . PREAMBLE . "logout.php'>D&eacute;connexion</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "schedule_operations/schedule_modification.php'>Sessions</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "schedule/'>Gestion d'horaire</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "reports/ens_snr_report.php'>Liste Enseignement</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "reports/surv_snr_report.php'>Liste Surveillance</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "shift/'>Gestion de quart</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "user/'>Gestion d'usag&eacute;</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "articles/'>articles</a></li>" . $tabs;
        $tabs = "<li><a href='" . PREAMBLE . "news_feed.php'>Fil d'actualit&eacute;</a></li>" . $tabs;
    } else {
        //todo: add all disconnected tabs
        $tabs = "<li><a href=\"" . PREAMBLE . "login.php\">Connexion</a></li>";
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
							<h1>Ilvo | Secteur Aquatique</h1>
							<div class=\"content\">
								<p>Bienvenue sur la page d'accueil d'Ilvo. Pour continuer, appuyez sur Connexion.</p>
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
														<input id=\"username\" name=\"username\" placeholder=\"NIE\" type=\"text\" value=\"\" />
														
													</div>
													<div class=\"col-12\">
														<input id=\"password\" name=\"password\" placeholder=\"Mot de passe\" type=\"password\" value=\"\" />
														
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
    $check_permission_sql = $db->query("SELECT role_id FROM user WHERE user.user_id = '$user_id';");

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
    $content .= "<table id='$selectedWeekDay' style='empty-cells: show; table-layout: fixed; width: 100%; display: none;' class=\"alt $location $selectedWeekDay\">
    <tbody>
    <tr><th>$selectedWeekDay</th></tr>
        ";

    $content .= '<tr><th></th></tr>';


    switch ($location) {
        case 'LT':
            $this_weeks_shifts_sql = "SELECT * FROM shift LEFT JOIN user on assigned_user = user_id WHERE location REGEXP 'LT|LT-SALLE|PIS-LT' AND schedule_id = '$schedule' AND day = '$selectedWeekDay'";
            break;
        case 'AB':
            $this_weeks_shifts_sql = "SELECT * FROM shift LEFT JOIN user on assigned_user = user_id WHERE location REGEXP 'AB|AB-SALLE|PIS-AB' AND schedule_id = '$schedule' AND day = '$selectedWeekDay'";
            break;
        default:
            $this_weeks_shifts_sql = "SELECT * FROM shift LEFT JOIN user on assigned_user = user_id WHERE location = '$location' AND schedule_id = '$schedule' AND day = '$selectedWeekDay'";
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
        if (!is_null($shift['assigned_user'])) {
            $shift_array[$index]['html'] .= ' user' . $shift['assigned_user'] . ' selected';
            $username = '<br />' . $shift['user_fname'] . ' ' . $shift['user_lname'];
        } else $username = '';
        $shift_array[$index]['html'] .= '" rowspan="' . (($duration / 5)) . '" data-start="' . $shift['start_time'] . '" data-end="' . $shift['end_time'] . '" id="' . $shift['shift_id'] . '">' . $shift['description'] . $username;

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
function print_seniority_dropdown($seniority_type, $db, $session)
{
    $get_seniority_sql = "SELECT * FROM seniority LEFT OUTER JOIN user u on seniority.user_id = u.user_id WHERE seniority_type = '$seniority_type' ORDER BY hours DESC, continued_service;";
    $get_seniorty_res = $db->query($get_seniority_sql);

    echo "<ol class=\"list-group $seniority_type\" style='max-height: 250px; overflow-y:scroll; display: none'>";

    while ($user = $get_seniorty_res->fetch_array(MYSQLI_ASSOC)) {
        $selected_user = $user['user_id'];
        $id = 'user' . $selected_user;
        echo "<li id='$id' class='list-group-item list-group-item-action' style='font-size: small;' ";

        $get_user_quals = $db->query("SELECT qualification.qualification_id, qual_name, qual_emitted, qual_expiry, requalification_note, notes
FROM qualified_user,
     qualification
WHERE qualification.qualification_id = qualified_user.qualification_id
  AND user_id = $selected_user
UNION
SELECT qualification.qualification_id,
       qual_name,
       NULL AS qual_emitted,
       NULL AS qual_expiry,
       NULL AS requalification_note,
       NULL AS notes
FROM qualified_user,
     qualification
WHERE qualification.qualification_id NOT IN (SELECT qualification.qualification_id
                                             FROM qualified_user,
                                                  qualification
                                             WHERE qualification.qualification_id = qualified_user.qualification_id
                                               AND user_id = $selected_user)
ORDER BY qualification_id;");

        while ($qual = $get_user_quals->fetch_array()) {
            $exp = '';
            $note = '';

            $id = $qual['qualification_id'];
            $name = $qual['qual_name'];
            if (isset($qual['qual_expiry'])) $exp = $qual['qual_expiry'];
            if (isset($qual['note'])) $note = $qual['note'];

            //echo " data-qual-$id-name='$name'";
            if (isset($qual['qual_expiry'])) echo " data-qual-$id-exp='$exp'";
            if (isset($qual['note'])) echo " data-qual-$id-note='$note'";
        }

        $get_user_avails = $db->query("SELECT day, start_time, end_time FROM availabilities LEFT OUTER JOIN availability_blocks ab on availabilities.block_id = ab.block_id WHERE user_id = '$selected_user' AND availabilities.sch_id = '$session';");

        $day = array();
        $start = array();
        $end = array();

        $i = 0;
        while ($avail = $get_user_avails->fetch_array()) {
            //print_r($avail);
            $day[$i] = $avail['day'];
            $start[$i] = $avail['start_time'];
            $end[$i] = $avail['end_time'];
            $i++;
        }

        $dayJson = json_encode($day);
        $startJson = json_encode($start);
        $endJson = json_encode($end);

        echo " data-avail-day='$dayJson' data-avail-start='$startJson' data-avail-end='$endJson' ";
//spec avail
        $get_spec_user_avails = $db->query("SELECT start_date, end_date, start_time, end_time, block_cat
FROM spec_availabilities
         LEFT OUTER JOIN spec_availability_blocks sab on spec_availabilities.block_id = sab.block_id
WHERE user_id = '$selected_user'
  AND sab.sch_id = '$session';");

        $start_date = array();
        $end_date = array();
        $start_time = array();
        $end_time = array();
        $block_cat = array();

        $i = 0;
        while ($spec_avail = $get_spec_user_avails->fetch_array()) {
            //print_r($avail);
            $start_date[$i] = $spec_avail['start_date'];
            $end_date[$i] = $spec_avail['end_date'];
            $start_time[$i] = $spec_avail['start_time'];
            $end_time[$i] = $spec_avail['end_time'];
            $block_cat[$i] = $spec_avail['block_cat'];
            $i++;
        }

        $start_dateJson = json_encode($start_date);
        $end_dateJson = json_encode($end_date);
        $start_timeJson = json_encode($start_time);
        $end_timeJson = json_encode($end_time);
        $block_catJson = json_encode($block_cat);


        echo " data-spec-avail-start='$start_dateJson' data-spec-avail-end='$end_dateJson' data-spec-start-timeJson='$start_timeJson' data-spec-start-end-timeJson='$end_timeJson' data-spec-block-cat='$block_catJson'";

        $user_info_res = $db->query("SELECT * FROM user_semester_avail WHERE user_id = '$selected_user' AND sch_id = '$session'")->fetch_array();

        echo " data-comment='" . $user_info_res['comments'] . "' data-avail='" . $user_info_res['avail_type'] . "' data-max-hours='" . $user_info_res['max_hours'] . "' ";

        echo ">";
        //echo $user['user_id']."<br />";
        echo $user['user_fname'] . " " . $user['user_lname'];
        echo "<br /><strong>" . $user['hours'] . "</strong>";
        echo "</li>";
    }

    echo "</ol>";
}